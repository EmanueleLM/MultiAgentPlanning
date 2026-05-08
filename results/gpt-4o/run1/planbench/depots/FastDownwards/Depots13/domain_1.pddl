(define (domain logistics-domain)
    (:requirements :strips :typing :negative-preconditions)
    (:types place surface hoist truck crate)
    (:predicates
        (at ?t - truck ?p - place)
        (at-hoist ?h - hoist ?p - place)
        (at-crate ?c - crate ?p - place)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (in ?c - crate ?t - truck)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
    )
    
    (:action drive-truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (at ?t ?from)
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift-crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at-hoist ?h ?p)
            (at-crate ?c ?p)
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at-crate ?c ?p))
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s)
            (not (on ?c ?s))
        )
    )

    (:action drop-crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at-hoist ?h ?p)
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (at-crate ?c ?p)
            (not (lifting ?h ?c))
            (available ?h)
            (not (clear ?s))
            (clear ?c)
            (on ?c ?s)
        )
    )

    (:action load-crate-onto-truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at-hoist ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in ?c ?t)
            (not (lifting ?h ?c))
            (available ?h)
        )
    )

    (:action unload-crate-from-truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at-hoist ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (lifting ?h ?c)
            (not (available ?h))
        )
    )
)