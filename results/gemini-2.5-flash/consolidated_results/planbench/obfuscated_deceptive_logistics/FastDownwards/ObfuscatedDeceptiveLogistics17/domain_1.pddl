(define (domain ObfuscatedDeceptiveLogistics17)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        thing
    )
    (:predicates
        (hand ?o - thing)
        (cats ?o - thing)
        (texture ?o - thing)
        (sneeze ?o - thing)
        (stupendous ?o - thing)
        (spring ?o - thing)
        (vase ?o1 - thing ?o2 - thing)
        (next ?o1 - thing ?o2 - thing)
        (collect ?o1 - thing ?o2 - thing)
    )

    (:action Paltry
        :parameters (?o0 - thing ?o1 - thing ?o2 - thing)
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
        )
    )

    (:action Sip
        :parameters (?o0 - thing ?o1 - thing ?o2 - thing)
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
        )
    )

    (:action Clip
        :parameters (?o0 - thing ?o1 - thing ?o2 - thing)
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
        )
    )

    (:action Wretched
        :parameters (?o0 - thing ?o1 - thing ?o2 - thing ?o3 - thing)
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
        )
    )

    (:action Memory
        :parameters (?o0 - thing ?o1 - thing ?o2 - thing)
        :precondition (and
            (cats ?o0)
            (spring ?o1)
            (spring ?o2)
            (next ?o0 ?o1)
        )
        :effect (and
            (next ?o0 ?o2)
            (not (next ?o0 ?o1))
        )
    )

    (:action Tightfisted
        :parameters (?o0 - thing ?o1 - thing ?o2 - thing)
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
        )
    )
)