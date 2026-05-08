(define (domain obfuscated_deceptive_logistics_35)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)
    (:predicates
        (hand ?o - object)
        (cats ?o - object)
        (texture ?o - object)
        (vase ?o1 ?o2 - object)
        (next ?o1 ?o2 - object)
        (sneeze ?o - object)
        (stupendous ?o - object)
        (collect ?o1 ?o2 - object)
        (spring ?o - object)
    )

    (:action paltry
        :parameters (?x - object ?y - object ?z - object)
        :precondition (and
            (hand ?x)
            (cats ?y)
            (texture ?z)
            (vase ?x ?y)
            (next ?y ?z)
        )
        :effect (and
            (next ?x ?z)
            (not (vase ?x ?y))
        )
    )

    (:action sip
        :parameters (?x - object ?y - object ?z - object)
        :precondition (and
            (hand ?x)
            (cats ?y)
            (texture ?z)
            (next ?x ?z)
            (next ?y ?z)
        )
        :effect (and
            (vase ?x ?y)
            (not (next ?x ?z))
        )
    )

    (:action clip
        :parameters (?x - object ?y - object ?z - object)
        :precondition (and
            (hand ?x)
            (sneeze ?y)
            (texture ?z)
            (next ?y ?z)
            (next ?x ?z)
        )
        :effect (and
            (vase ?x ?y)
            (not (next ?x ?z))
        )
    )

    (:action wretched
        :parameters (?w - object ?x - object ?y - object ?z - object)
        :precondition (and
            (sneeze ?w)
            (texture ?x)
            (texture ?y)
            (stupendous ?z)
            (next ?w ?x)
            (collect ?x ?z)
            (collect ?y ?z)
        )
        :effect (and
            (next ?w ?y)
            (not (next ?w ?x))
        )
    )

    (:action memory
        :parameters (?x - object ?y - object ?z - object)
        :precondition (and
            (cats ?x)
            (spring ?y)
            (spring ?z)
            (next ?x ?y)
        )
        :effect (and
            (next ?x ?z)
            (not (next ?x ?y))
        )
    )

    (:action tightfisted
        :parameters (?x - object ?y - object ?z - object)
        :precondition (and
            (hand ?x)
            (sneeze ?y)
            (texture ?z)
            (next ?y ?z)
            (vase ?x ?y)
        )
        :effect (and
            (next ?x ?z)
            (not (vase ?x ?y))
        )
    )
)