(define (domain depots5)
    (:requirements :typing)
    (:types
        place - object
        depot distributor - place
        truck hoist surface - object
        pallet crate - surface
    )

    (:predicates
        (at ?obj - object ?p - place)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (lifting ?h - hoist ?c - crate)
        (available ?h - hoist)
        (clear ?s - surface)
    )

    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (at ?t ?from)
        :effect (and (at ?t ?to) (not (at ?t ?from)))
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and 
            (at ?h ?p) 
            (at ?c ?p) 
            (available ?h) 
            (clear ?c) 
            (on ?c ?s)
        )
        :effect (and 
            (not (at ?c ?p)) 
            (lifting ?h ?c) 
            (not (available ?h)) 
            (not (clear ?c)) 
            (not (on ?c ?s)) 
            (clear ?s)
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and 
            (at ?h ?p) 
            (at ?s ?p) 
            (lifting ?h ?c) 
            (clear ?s)
        )
        :effect (and 
            (at ?c ?p) 
            (available ?h) 
            (not (lifting ?h ?c)) 
            (on ?c ?s) 
            (not (clear ?s)) 
            (clear ?c)
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
            (in ?c ?t) 
            (available ?h) 
            (not (lifting ?h ?c))
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
            (lifting ?h ?c) 
            (not (available ?h)) 
            (not (in ?c ?t))
        )
    )
)