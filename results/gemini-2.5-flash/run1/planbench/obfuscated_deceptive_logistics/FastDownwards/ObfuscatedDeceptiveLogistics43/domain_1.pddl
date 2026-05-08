(define (domain obfuscated_deceptive_logistics)
    (:requirements :strips :typing)
    (:types obj)
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

    ;; Action: paltry
    (:action paltry
        :parameters (?p0 - obj ?p1 - obj ?p2 - obj)
        :precondition (and
            (hand ?p0)
            (cats ?p1)
            (texture ?p2)
            (vase ?p0 ?p1)
            (next ?p1 ?p2)
        )
        :effect (and
            (next ?p0 ?p2)
            (not (vase ?p0 ?p1))
        )
    )

    ;; Action: sip
    (:action sip
        :parameters (?p0 - obj ?p1 - obj ?p2 - obj)
        :precondition (and
            (hand ?p0)
            (cats ?p1)
            (texture ?p2)
            (next ?p0 ?p2)
            (next ?p1 ?p2)
        )
        :effect (and
            (vase ?p0 ?p1)
            (not (next ?p0 ?p2))
        )
    )

    ;; Action: clip
    (:action clip
        :parameters (?p0 - obj ?p1 - obj ?p2 - obj)
        :precondition (and
            (hand ?p0)
            (sneeze ?p1)
            (texture ?p2)
            (next ?p1 ?p2)
            (next ?p0 ?p2)
        )
        :effect (and
            (vase ?p0 ?p1)
            (not (next ?p0 ?p2))
        )
    )

    ;; Action: wretched
    (:action wretched
        :parameters (?p0 - obj ?p1 - obj ?p2 - obj ?p3 - obj)
        :precondition (and
            (sneeze ?p0)
            (texture ?p1)
            (texture ?p2)
            (stupendous ?p3)
            (next ?p0 ?p1)
            (collect ?p1 ?p3)
            (collect ?p2 ?p3)
        )
        :effect (and
            (next ?p0 ?p2)
            (not (next ?p0 ?p1))
        )
    )

    ;; Action: memory
    (:action memory
        :parameters (?p0 - obj ?p1 - obj ?p2 - obj)
        :precondition (and
            (cats ?p0)
            (spring ?p1)
            (spring ?p2)
            (next ?p0 ?p1)
        )
        :effect (and
            (next ?p0 ?p2)
            (not (next ?p0 ?p1))
        )
    )

    ;; Action: tightfisted
    (:action tightfisted
        :parameters (?p0 - obj ?p1 - obj ?p2 - obj)
        :precondition (and
            (hand ?p0)
            (sneeze ?p1)
            (texture ?p2)
            (next ?p1 ?p2)
            (vase ?p0 ?p1)
        )
        :effect (and
            (next ?p0 ?p2)
            (not (vase ?p0 ?p1))
        )
    )
)