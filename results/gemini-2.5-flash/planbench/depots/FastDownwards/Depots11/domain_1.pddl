(define (domain depots11)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        surface
        hoist
        truck
        depot distributor - place
        crate pallet - surface
    )
    (:predicates
        (at ?obj - (or crate pallet hoist truck) ?loc - place)
        (available ?h - hoist)
        (clear ?s - surface) ; true if nothing is on top of ?s
        (on ?c - crate ?s - surface) ; ?c is on top of ?s
        (lifting ?h - hoist ?c - crate) ; ?h is lifting ?c
        (in ?c - crate ?t - truck) ; ?c is inside ?t
        (connected ?p1 - place ?p2 - place) ; ?p1 and ?p2 are connected by a road
    )

    (:action drive_truck
        :parameters (?t - truck ?from ?to - place)
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
            (clear ?c)
        )
        :effect (and
            (not (at ?c ?p))
            (not (on ?c ?s))
            (clear ?s)
            (not (available ?h))
            (lifting ?h ?c)
            ; The specification for 'lift_crate' does not explicitly state that (clear ?c) becomes false.
            ; Adhering strictly to the given effects, this predicate's state for ?c remains unchanged here.
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (not (lifting ?h ?c))
            (available ?h)
            (at ?c ?p)
            (on ?c ?s)
            (not (clear ?s))
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
            (not (lifting ?h ?c))
            (available ?h)
            ; The human specification for load_crate effects was truncated.
            ; Inferred effects: hoist no longer lifting, hoist becomes available, crate is in truck.
            ; (not (at ?c ?p)) is implicitly true as the crate is no longer on a surface, but in the truck.
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
            ; The specification does not explicitly state (at ?c ?p) for the unloaded crate,
            ; as it is now being lifted.
        )
    )
)