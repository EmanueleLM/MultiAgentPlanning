(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place surface truck hoist - object ; These are top-level types, children of 'object'
        depot distributor - place
        crate pallet - surface
    )
    (:predicates
        (at ?obj - object ?loc - place) ; Changed from (either ...) to a generic object for FastDownwards compatibility
        (connected ?p1 - place ?p2 - place)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (in_truck ?c - crate ?t - truck)
        (clear ?s - surface)
        (on ?c - crate ?s - surface)
    )

    ;; Action: Drive a truck from one place to another
    (:action drive_truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
            (connected ?from ?to)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    ;; Action: Lift a crate from a surface using a hoist
    (:action lift_crate_from_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (at ?s ?p) ; The surface must also be at the place
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer at the place (it's being lifted)
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface it was on becomes clear
            (not (on ?c ?s))
        )
    )

    ;; Action: Drop a crate to a surface using a hoist
    (:action drop_crate_to_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; The surface must be at the place
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now at the place, no longer being lifted
            (not (clear ?s)) ; The surface it's dropped onto is no longer clear
            (clear ?c) ; The crate itself becomes clear (nothing on it by this action)
            (on ?c ?s)
        )
    )

    ;; Action: Load a crate into a truck using a hoist
    (:action load_crate_to_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c) ; Hoist must be lifting the crate to load it
        )
        :effect (and
            (in_truck ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
            (not (at ?c ?p)) ; Crate is no longer at the place, it's inside the truck
        )
    )

    ;; Action: Unload a crate from a truck using a hoist
    (:action unload_crate_from_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to perform the unload operation
            (in_truck ?c ?t)
        )
        :effect (and
            (not (in_truck ?c ?t))
            (not (available ?h)) ; Hoist becomes busy (lifting the crate)
            (lifting ?h ?c)
            (at ?c ?p) ; Crate is now at the place, being lifted by the hoist
        )
    )
)