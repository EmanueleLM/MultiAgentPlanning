(define (domain obfuscated_deceptive_logistics11)
    (:requirements :strips :typing :negative-preconditions)
    (:types thing)
    (:predicates
        (hand ?o - thing)
        (cats ?o - thing)
        (texture ?o - thing)
        (sneeze ?o - thing)
        (spring ?o - thing)
        (stupendous ?o - thing)
        (vase ?o1 ?o2 - thing)
        (next ?o1 ?o2 - thing)
        (collect ?o1 ?o2 - thing)
    )

    (:action paltry
        :parameters (?o0 ?o1 ?o2 - thing)
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

    (:action sip
        :parameters (?o0 ?o1 ?o2 - thing)
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

    (:action clip
        :parameters (?o0 ?o1 ?o2 - thing)
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

    (:action wretched
        :parameters (?o0 ?o1 ?o2 ?o3 - thing)
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

    (:action memory
        :parameters (?o0 ?o1 ?o2 - thing)
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

    (:action tightfisted
        :parameters (?o0 ?o1 ?o2 - thing)
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