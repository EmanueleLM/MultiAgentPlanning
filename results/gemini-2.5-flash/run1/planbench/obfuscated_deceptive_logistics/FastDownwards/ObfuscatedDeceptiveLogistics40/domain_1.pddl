(define (domain obfuscated_deceptive_logistics_40)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)
    (:predicates
        (hand ?o - object)
        (cats ?o - object)
        (texture ?o - object)
        (sneeze ?o - object)
        (spring ?o - object)
        (stupendous ?o - object)
        (vase ?o1 - object ?o2 - object)
        (next ?o1 - object ?o2 - object)
        (collect ?o1 - object ?o2 - object)
    )

    (:action paltry
        :parameters (?h - object ?c - object ?t - object)
        :precondition (and
            (hand ?h)
            (cats ?c)
            (texture ?t)
            (vase ?h ?c)
            (next ?c ?t)
        )
        :effect (and
            (next ?h ?t)
            (not (vase ?h ?c))
        )
    )

    (:action sip
        :parameters (?h - object ?c - object ?t - object)
        :precondition (and
            (hand ?h)
            (cats ?c)
            (texture ?t)
            (next ?h ?t)
            (next ?c ?t)
        )
        :effect (and
            (vase ?h ?c)
            (not (next ?h ?t))
        )
    )

    (:action clip
        :parameters (?h - object ?s - object ?t - object)
        :precondition (and
            (hand ?h)
            (sneeze ?s)
            (texture ?t)
            (next ?s ?t)
            (next ?h ?t)
        )
        :effect (and
            (vase ?h ?s)
            (not (next ?h ?t))
        )
    )

    (:action wretched
        :parameters (?s1 - object ?t1 - object ?t2 - object ?stup - object)
        :precondition (and
            (sneeze ?s1)
            (texture ?t1)
            (texture ?t2)
            (stupendous ?stup)
            (next ?s1 ?t1)
            (collect ?t1 ?stup)
            (collect ?t2 ?stup)
        )
        :effect (and
            (next ?s1 ?t2)
            (not (next ?s1 ?t1))
        )
    )

    (:action memory
        :parameters (?c1 - object ?p1 - object ?p2 - object)
        :precondition (and
            (cats ?c1)
            (spring ?p1)
            (spring ?p2)
            (next ?c1 ?p1)
        )
        :effect (and
            (next ?c1 ?p2)
            (not (next ?c1 ?p1))
        )
    )

    (:action tightfisted
        :parameters (?h - object ?s - object ?t - object)
        :precondition (and
            (hand ?h)
            (sneeze ?s)
            (texture ?t)
            (next ?s ?t)
            (vase ?h ?s)
        )
        :effect (and
            (next ?h ?t)
            (not (vase ?h ?s))
        )
    )
)