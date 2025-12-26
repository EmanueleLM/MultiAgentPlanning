(define (domain ObfuscatedDeceptiveLogistics27)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types object)

    (:predicates
        (cats ?o - object)
        (collect ?o0 - object ?o1 - object)
        (hand ?o - object)
        (next ?o0 - object ?o1 - object)
        (sneeze ?o - object)
        (spring ?o - object)
        (stupendous ?o - object)
        (texture ?o - object)
        (vase ?o0 - object ?o1 - object)
    )

    (:functions
        (total-cost) - number
    )

    (:action Paltry
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and
            (hand ?o0)
            (cats ?o1)
            (texture ?o2)
            (vase ?o0 ?o1)
            (next ?o1 ?o2)
        )
        :effect (and
            (next ?o0 ?o2)
            (not (vase ?o0 ?o1))
            (increase (total-cost) 1)
        )
    )

    (:action Sip
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and
            (hand ?o0)
            (cats ?o1)
            (texture ?o2)
            (next ?o0 ?o2)
            (next ?o1 ?o2)
        )
        :effect (and
            (vase ?o0 ?o1)
            (not (next ?o0 ?o2))
            (increase (total-cost) 1)
        )
    )

    (:action Clip
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and
            (hand ?o0)
            (sneeze ?o1)
            (texture ?o2)
            (next ?o1 ?o2)
            (next ?o0 ?o2)
        )
        :effect (and
            (vase ?o0 ?o1)
            (not (next ?o0 ?o2))
            (increase (total-cost) 1)
        )
    )

    (:action Wretched
        :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
        :precondition (and
            (sneeze ?o0)
            (texture ?o1)
            (texture ?o2)
            (stupendous ?o3)
            (next ?o0 ?o1)
            (collect ?o1 ?o3)
            (collect ?o2 ?o3)
        )
        :effect (and
            (next ?o0 ?o2)
            (not (next ?o0 ?o1))
            (increase (total-cost) 1)
        )
    )

    (:action Memory
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and
            (cats ?o0)
            (spring ?o1)
            (spring ?o2)
            (next ?o0 ?o1)
        )
        :effect (and
            (next ?o0 ?o2)
            (not (next ?o0 ?o1))
            (increase (total-cost) 1)
        )
    )

    (:action Tightfisted
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and
            (hand ?o0)
            (sneeze ?o1)
            (texture ?o2)
            (next ?o1 ?o2)
            (vase ?o0 ?o1)
        )
        :effect (and
            (next ?o0 ?o2)
            (not (vase ?o0 ?o1))
            (increase (total-cost) 1)
        )
    )
)