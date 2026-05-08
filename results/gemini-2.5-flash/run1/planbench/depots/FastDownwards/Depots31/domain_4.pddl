(define (domain depots31)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        locatable_item
        place
        depot distributor - place
        surface
        pallet - surface locatable_item
        crate - surface locatable_item
        truck - locatable_item
        hoist - locatable_item
    )
    (:predicates
        (at_loc ?o - locatable_item ?p - place)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (clear ?s - surface)
        (on ?c - crate ?s - surface)
        (in_truck ?c - crate ?t - truck)
        (connected ?p1 - place ?p2 - place)
    )

    (:action drive_truck
        :parameters (?t - truck ?p_from - place ?p_to - place)
        :precondition (and
            (at_loc ?t ?p_from)
            (connected ?p_from ?p_to)
        )
        :effect (and
            (not (at_loc ?t ?p_from))
            (at_loc ?t ?p_to)
        )
    )

    (:action lift_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at_loc ?h ?p)
            (available ?h)
            (at_loc ?c ?p)
            (on ?c ?s) ; Crate must be on a surface to be lifted from it
            (at_loc ?s ?p) ; The surface must also be at the same place
            (clear ?c) ; The crate itself must be clear to be lifted
        )
        :effect (and
            (not (at_loc ?c ?p))
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface it was on is now clear
            (not (on ?c ?s))
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at_loc ?h ?p)
            (at_loc ?s ?p)
            (clear ?s) ; Target surface must be clear
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at_loc ?c ?p)
            (not (clear ?s)) ; Target surface is no longer clear
            (clear ?c) ; The dropped crate itself is clear
            (on ?c ?s)
        )
    )

    (:action load_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at_loc ?h ?p)
            (at_loc ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in_truck ?c ?t)
            (not (lifting ?h ?c))
            (available ?h)
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at_loc ?h ?p)
            (at_loc ?t ?p)
            (available ?h)
            (in_truck ?c ?t)
        )
        :effect (and
            (not (in_truck ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
        )
    )
)