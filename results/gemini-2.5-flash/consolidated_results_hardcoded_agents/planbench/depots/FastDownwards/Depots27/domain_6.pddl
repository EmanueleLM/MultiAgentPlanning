(define (domain Depots27)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place       
        item
        hoist - item       
        truck - item       
        surface - item    
        pallet - surface
        crate - surface
    )
    (:predicates
        (at ?x - item ?p - place)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (loaded ?c - crate ?t - truck)
        (available ?h - hoist)
    )
    
    (:functions (total-cost) - number)

    (:action DRIVE
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (and (at ?t ?p1))
        :effect (and (not (at ?t ?p1))
                     (at ?t ?p2)
                     (increase (total-cost) 1)
                )
    )

    (:action LIFT
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and (available ?h)
                           (at ?h ?p)
                           (at ?c ?p)
                           (at ?s ?p)
                           (on ?c ?s)
                           (clear ?c)
                       )
        :effect (and (not (on ?c ?s))
                     (not (clear ?c))
                     (clear ?s)
                     (lifting ?h ?c)
                     (not (available ?h))
                     (not (at ?c ?p))
                     (increase (total-cost) 1)
                )
    )

    (:action DROP
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and (lifting ?h ?c)
                           (at ?h ?p)
                           (at ?s ?p)
                           (clear ?s)
                       )
        :effect (and (available ?h)
                     (not (lifting ?h ?c))
                     (at ?c ?p)
                     (on ?c ?s)
                     (not (clear ?s))
                     (clear ?c)
                     (increase (total-cost) 1)
                )
    )

    (:action LOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and (lifting ?h ?c)
                           (at ?h ?p)
                           (at ?t ?p)
                       )
        :effect (and (available ?h)
                     (not (lifting ?h ?c))
                     (loaded ?c ?t)
                     (increase (total-cost) 1)
                )
    )

    (:action UNLOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and (available ?h)
                           (at ?h ?p)
                           (at ?t ?p)
                           (loaded ?c ?t)
                       )
        :effect (and (lifting ?h ?c)
                     (not (loaded ?c ?t))
                     (not (available ?h))
                     (increase (total-cost) 1)
                )
    )