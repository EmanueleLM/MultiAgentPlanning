(define (domain ObfuscatedDeceptiveLogistics19)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        obj
    )
    (:predicates
        (hand ?o - obj)
        (cats ?o - obj)
        (texture ?o - obj)
        (vase ?o1 - obj ?o2 - obj)
        (next ?o1 - obj ?o2 - obj)
        (sneeze ?o - obj)
        (stupendous ?o - obj)
        (collect ?o1 - obj ?o2 - obj)
        (spring ?o - obj)
    )

    ;; 1. Paltry(?o0, ?o1, ?o2)
    (:action Paltry
        :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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

    ;; 2. Sip(?o0, ?o1, ?o2)
    (:action Sip
        :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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

    ;; 3. Clip(?o0, ?o1, ?o2)
    (:action Clip
        :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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

    ;; 4. Wretched(?o0, ?o1, ?o2, ?o3)
    (:action Wretched
        :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj)
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

    ;; 5. Memory(?o0, ?o1, ?o2)
    (:action Memory
        :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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

    ;; 6. Tightfisted(?o0, ?o1, ?o2)
    (:action Tightfisted
        :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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