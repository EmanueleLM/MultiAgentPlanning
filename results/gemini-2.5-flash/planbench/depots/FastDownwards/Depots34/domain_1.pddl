(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot distributor - place
        surface
        pallet crate - surface
        hoist
        truck
    )
    (:predicates
        (at ?obj - (or truck hoist pallet crate) ?loc - place)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
        (connected ?p1 - place ?p2 - place)
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
            (on ?c ?s)
            (available ?h)
            (clear ?c) ; The crate itself must be clear to be lifted
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer 'at' the place when lifted
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface the crate was on becomes clear
            (not (on ?c ?s))
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s) ; The target surface must be clear
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now at the place, after being dropped
            (not (clear ?s))
            (clear ?c) ; Crate itself becomes clear (it's on top of the new stack)
            (on ?c ?s)
        )
    )

    (:action load_crate_into_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (not (lifting ?h ?c))
            (available ?h)
            (in ?c ?t)
            ; The human specification for effects was incomplete; inferred that the hoist
            ; releases the crate and becomes available, and the crate is now in the truck.
            ; No change to 'clear' status of the crate as it's not being stacked.
        )
    )

    (:action unload_crate_from_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to unload
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
            ; The human specification for effects was incomplete; inferred that the crate
            ; is no longer in the truck, the hoist becomes unavailable and starts lifting it.
            ; No change to 'clear' status of the crate as it's not being stacked.
        )
    )
)