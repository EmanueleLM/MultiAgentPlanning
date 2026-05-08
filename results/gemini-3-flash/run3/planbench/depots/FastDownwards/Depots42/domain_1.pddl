(define (domain depots)
    (:requirements :typing)
    (:types
        place - object
        depot distributor - place
        locatable - object
        truck hoist surface - locatable
        pallet crate - surface
    )

    (:predicates
        (at ?obj - locatable ?p - place)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (lifting ?h - hoist ?c - crate)
        (available ?h - hoist)
        (clear ?s - surface)
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
        :parameters (?c - crate ?s - surface ?h - hoist ?p - place)
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
            (not (clear ?c))
        )
    )

    (:action drop
        :parameters (?c - crate ?s - surface ?h - hoist ?p - place)
        :precondition (and 
            (at ?h ?p) 
            (at ?s ?p) 
            (lifting ?h ?c) 
            (clear ?s)
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

    (:action load
        :parameters (?c - crate ?h - hoist ?t - truck ?p - place)
        :precondition (and 
            (at ?h ?p) 
            (at ?t ?p) 
            (lifting ?h ?c)
        )
        :effect (and 
            (available ?h) 
            (not (lifting ?h ?c)) 
            (in ?c ?t)
        )
    )

    (:action unload
        :parameters (?c - crate ?h - hoist ?t - truck ?p - place)
        :precondition (and 
            (at ?h ?p) 
            (at ?t ?p) 
            (available ?h) 
            (in ?c ?t)
        )
        :effect (and 
            (not (available ?h)) 
            (lifting ?h ?c) 
            (not (in ?c ?t))
        )
    )
)