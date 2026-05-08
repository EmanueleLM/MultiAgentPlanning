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
        (at ?x - (either truck hoist), ?p - place)
        (at_surface_loc ?s - surface, ?p - place) ; Location of any surface, whether fixed (pallet) or movable (crate when resting)
        (on ?c - crate, ?s - surface)
        (in ?c - crate, ?t - truck)
        (lifting ?h - hoist, ?c - crate)
        (available ?h - hoist)
        (clear ?s - surface)
        (road ?from ?to - place)
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
            (at_surface_loc ?s ?p) ; The surface the crate is on must be at the place
            (available ?h)
            (clear ?c)          ; The crate itself must be clear to be lifted
            (on ?c ?s)
            (at_surface_loc ?c ?p) ; The crate must be resting at the place
        )
        :effect (and
            (not (on ?c ?s))
            (not (at_surface_loc ?c ?p)) ; Crate is no longer resting at the place
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s)                  ; The surface it was on becomes clear
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at_surface_loc ?s ?p) ; The target surface must be at the place
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at_surface_loc ?c ?p) ; Crate is now resting at the place
            (not (clear ?s))
            (on ?c ?s)
            (clear ?c)                  ; The top of the dropped crate is clear
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
            (available ?h) ; Hoist must be available to pick up the crate from the truck
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h)) ; Hoist is now lifting, so not available
            (lifting ?h ?c)
        )
    )