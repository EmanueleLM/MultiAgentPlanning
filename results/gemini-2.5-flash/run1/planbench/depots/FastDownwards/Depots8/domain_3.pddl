(define (domain depots_domain)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        locatable ; Base type for any object that can be located at a place
        place
        surface

        depot distributor - place
        hoist truck - locatable
        pallet crate - surface locatable ; Pallets and crates are both surfaces and locatable objects
    )
    (:predicates
        (at ?obj - locatable ?p - place) ; Object is at a specific place
        (on ?c - crate ?s - surface) ; Crate C is physically on surface S
        (clear ?s - surface) ; Surface S has nothing placed on top of it
        (available ?h - hoist) ; Hoist H is not currently busy
        (lifting ?h - hoist ?c - crate) ; Hoist H is currently lifting crate C
        (in ?c - crate ?t - truck) ; Crate C is inside truck T
        (connected ?from - place ?to - place) ; Indicates a direct road connection between two places
    )

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

    (:action lift_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (clear ?c) ; Crate C must be clear to be lifted
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer at the place once lifted
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface S is now clear
            (not (on ?c ?s))
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; The target surface S must be at the same place
            (clear ?s) ; The target surface S must be clear to drop on it
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now at the place, resting on a surface
            (not (clear ?s)) ; Surface S is no longer clear
            (clear ?c) ; Crate C itself is clear (nothing on top of it after being dropped)
            (on ?c ?s)
        )
    )

    (:action load_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
            (not (at ?c ?p)) ; Explicitly remove (at ?c ?p), as it's now inside the truck
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to start the unloading process
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c) ; Hoist is now lifting the crate
            (clear ?c) ; Crate C is clear after being unloaded
            ; Crate is currently lifted, so (at ?c ?p) is not added here. It will be added by drop_crate.
        )
    )
)