(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        depot distributor - place
        crate pallet - surface
        place surface truck hoist
    )
    (:predicates
        (at ?obj - (hoist truck crate pallet) ?loc - place)
        (connected ?p1 - place ?p2 - place)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (in_truck ?c - crate ?t - truck)
        (clear ?s - surface) ; A surface (crate or pallet) is clear if nothing is on it
        (on ?c - crate ?s - surface) ; A crate is on a surface
    )

    ;; Action: Drive a truck from one place to another
    (:action drive_truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
            (connected ?from ?to)
            (not (at ?t ?to)) ; Ensure truck is not already at the destination
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
            (at ?s ?p)
            (available ?h)
            (clear ?c) ; Crate itself must be clear to be lifted
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer considered "at" the place, but "with hoist"
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface becomes clear
            (not (on ?c ?s))
        )
    )

    ;; Action: Drop a crate to a surface using a hoist
    (:action drop_crate_to_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s) ; Target surface must be clear
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now at the place, no longer just "with hoist"
            (not (clear ?s)) ; Surface is no longer clear
            (clear ?c) ; Crate is now clear (nothing on it and not being lifted)
            (on ?c ?s)
        )
    )

    ;; Action: Load a crate into a truck using a hoist
    ;; Effects inferred from 'unload' action and logical consistency, as problem statement omits them.
    (:action load_crate_to_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c) ; Hoist must be lifting the crate
        )
        :effect (and
            (in_truck ?c ?t)
            (available ?h) ; Hoist becomes available
            (not (lifting ?h ?c))
            (not (at ?c ?p)) ; Crate is now in truck, not just "at" the place
        )
    )

    ;; Action: Unload a crate from a truck using a hoist
    (:action unload_crate_from_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to start unloading
            (in_truck ?c ?t)
        )
        :effect (and
            (not (in_truck ?c ?t))
            (not (available ?h))
            (lifting ?h ?c) ; Hoist is now lifting the crate
            (at ?c ?p) ; Crate is now at the place, but held by hoist
        )
    )
)