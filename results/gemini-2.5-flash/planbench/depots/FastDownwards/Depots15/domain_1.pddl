(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        depot distributor - place
        surface - object
        pallet crate - surface
        truck hoist - object
    )
    (:predicates
        (at_place ?obj - (truck hoist crate pallet) ?p - place)
        (in_truck ?c - crate ?t - truck)
        (hoist_available ?h - hoist)
        (hoist_lifting ?h - hoist ?c - crate)
        (clear ?s - surface) ; nothing is on top of ?s
        (on ?c - crate ?s - surface) ; ?c is on top of ?s
    )

    (:action drive_truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (at_place ?t ?from)
        :effect (and
            (not (at_place ?t ?from))
            (at_place ?t ?to)
        )
    )

    (:action lift_crate_from_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at_place ?h ?p)
            (at_place ?c ?p)
            (hoist_available ?h)
            (clear ?c) ; nothing on top of the crate being lifted
            (on ?c ?s)
        )
        :effect (and
            (not (at_place ?c ?p))
            (hoist_lifting ?h ?c)
            (not (hoist_available ?h))
            (clear ?s) ; the surface becomes clear
            (not (clear ?c)) ; the crate is no longer clear as it's being lifted
            (not (on ?c ?s))
        )
    )

    (:action drop_crate_to_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at_place ?h ?p)
            (at_place ?s ?p) ; surface needs to be at the place
            (clear ?s) ; surface must be clear to drop onto
            (hoist_lifting ?h ?c)
        )
        :effect (and
            (hoist_available ?h)
            (not (hoist_lifting ?h ?c))
            (at_place ?c ?p)
            (not (clear ?s))
            (clear ?c) ; crate becomes clear again
            (on ?c ?s)
        )
    )

    (:action load_crate_into_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at_place ?h ?p)
            (at_place ?t ?p)
            (hoist_lifting ?h ?c)
        )
        :effect (and
            (not (hoist_lifting ?h ?c))
            (hoist_available ?h)
            (in_truck ?c ?t)
            (not (at_place ?c ?p)) ; crate is now in truck, not at place
            (not (clear ?c)) ; crate is not clear while in truck
        )
    )

    (:action unload_crate_from_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at_place ?h ?p)
            (at_place ?t ?p)
            (hoist_available ?h)
            (in_truck ?c ?t)
        )
        :effect (and
            (not (in_truck ?c ?t))
            (not (hoist_available ?h))
            (hoist_lifting ?h ?c)
            (not (at_place ?c ?p)) ; crate is now being lifted, not at place
            (not (clear ?c)) ; crate is not clear while being lifted
        )
    )
)