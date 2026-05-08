(define (domain depots31)
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
        (at ?x - (either truck hoist), ?p - place) ; Location of trucks and hoists
        (at_surface_loc ?s - surface, ?p - place) ; Location of crates and pallets when resting on a surface
        (on ?c - crate, ?s - surface) ; ?c is on top of ?s
        (in ?c - crate, ?t - truck) ; ?c is inside ?t
        (lifting ?h - hoist, ?c - crate) ; ?h is lifting ?c
        (available ?h - hoist) ; ?h is free to be used
        (clear ?s - surface) ; ?s has nothing on top of it
        (road ?from ?to - place) ; Indicates a direct road connection between two places
    )

    (:action drive_truck
        :parameters (?t - truck ?from ?to - place)
        :precondition (and
            (at ?t ?from)
            (road ?from ?to)
            (not (= ?from ?to))
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
            (at_surface_loc ?c ?p)
            (at_surface_loc ?s ?p)
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (on ?c ?s))
            (not (at_surface_loc ?c ?p))
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s)
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at_surface_loc ?s ?p)
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at_surface_loc ?c ?p)
            (not (clear ?s))
            (on ?c ?s)
            (clear ?c)
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
        )
    )

    (:action unload_crate
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
            (lifting ?h ?c)
        )
    )
)