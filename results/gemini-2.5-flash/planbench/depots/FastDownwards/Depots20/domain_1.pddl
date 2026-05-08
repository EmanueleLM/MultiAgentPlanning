(define (domain depots20)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot distributor - place
        surface
        pallet crate - surface
        truck
        hoist
    )
    (:predicates
        (at ?obj - (truck hoist crate pallet) ?loc - place)
        (in ?c - crate ?t - truck)
        (on ?c - crate ?s - surface)
        (clear ?s - surface) ; top of a surface (pallet or crate) is clear
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
    )

    (:action drive_truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift_crate_from_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (clear ?c) ; the crate itself must be clear on top to be lifted
            (on ?c ?s) ; the crate is currently on the surface
        )
        :effect (and
            (not (at ?c ?p)) ; crate is no longer at the place, it's being lifted
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; the surface it was on becomes clear
            (not (on ?c ?s))
            (not (clear ?c)) ; the lifted crate is no longer considered "clear" as a surface
        )
    )

    (:action drop_crate_to_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s) ; target surface must be clear to drop something on it
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; crate is now at the place
            (not (clear ?s)) ; target surface is no longer clear
            (clear ?c) ; crate is now clear on top, available for stacking
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
            (not (at ?c ?p)) ; crate is no longer directly at the place
            (not (clear ?c)) ; crate is inside truck, not a clear surface
        )
    )

    (:action unload_crate_from_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c) ; hoist is now lifting the crate
            (at ?c ?p) ; crate is now at the place, held by hoist
        )
    )
)