(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot distributor - place
        surface
        locatable
        pallet crate - surface locatable ; pallet and crate are both surfaces and locatables
        truck hoist - locatable
    )

    (:predicates
        (at ?o - locatable ?l - place) ; Changed to use the new 'locatable' supertype
        (available ?h - hoist)
        (clear ?s - surface) ; nothing is on top of this surface
        (lifting ?h - hoist ?c - crate) ; hoist h is lifting crate c
        (in ?c - crate ?t - truck) ; crate c is inside truck t
        (on ?c - crate ?s - surface) ; crate c is on surface s
    )

    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (at ?t ?from)
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p) ; crate must be resting at the place
            (at ?s ?p) ; surface must be at the place
            (available ?h)
            (clear ?c) ; nothing on top of crate c
            (on ?c ?s) ; crate c is on surface s
        )
        :effect (and
            (not (at ?c ?p)) ; crate is no longer resting at the place while lifted
            (not (on ?c ?s))
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; surface s is now clear
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; surface must be at the place
            (clear ?s) ; surface s must be clear to drop on
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; crate is back resting at the place
            (not (clear ?s)) ; surface s is no longer clear
            (clear ?c) ; crate c is clear (nothing on it)
            (on ?c ?s)
        )
    )

    (:action load
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
        )
    )

    (:action unload
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