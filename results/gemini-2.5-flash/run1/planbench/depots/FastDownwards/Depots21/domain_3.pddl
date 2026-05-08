(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        depot distributor - place
        crate pallet - surface
        place surface truck hoist
    )
    (:predicates
        (at ?obj - (either hoist truck crate pallet) ?loc - place)
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
            (at ?s ?p)
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p))
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s)
            (not (on ?c ?s))
        )
    )

    ;; Action: Drop a crate to a surface using a hoist
    (:action drop_crate_to_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p)
            (not (clear ?s))
            (clear ?c)
            (on ?c ?s)
        )
    )

    ;; Action: Load a crate into a truck using a hoist
    (:action load_crate_to_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in_truck ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
            (not (at ?c ?p))
        )
    )

    ;; Action: Unload a crate from a truck using a hoist
    (:action unload_crate_from_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in_truck ?c ?t)
        )
        :effect (and
            (not (in_truck ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
            (at ?c ?p)
        )
    )