(define (domain object_play)
    (:requirements :strips :typing :negative-preconditions)
    (:types entity)
    (:predicates
        (hand ?x - entity)
        (cats ?x - entity)
        (texture ?x - entity)
        (sneeze ?x - entity)
        (stupendous ?x - entity)
        (spring ?x - entity)
        (collect ?x ?y - entity)
        (next ?x ?y - entity)
        (vase ?x ?y - entity)
    )
    
    (:action paltry
        :parameters (?obj_0 ?obj_1 ?obj_2 - entity)
        :precondition (and
            (hand ?obj_0)
            (cats ?obj_1)
            (texture ?obj_2)
            (vase ?obj_0 ?obj_1)
            (next ?obj_1 ?obj_2)
        )
        :effect (and
            (next ?obj_0 ?obj_2)
            (not (vase ?obj_0 ?obj_1))
        )
    )

    (:action sip
        :parameters (?obj_0 ?obj_1 ?obj_2 - entity)
        :precondition (and
            (hand ?obj_0)
            (cats ?obj_1)
            (texture ?obj_2)
            (next ?obj_0 ?obj_2)
            (next ?obj_1 ?obj_2)
        )
        :effect (and
            (vase ?obj_0 ?obj_1)
            (not (next ?obj_0 ?obj_2))
        )
    )

    (:action clip
        :parameters (?obj_0 ?obj_1 ?obj_2 - entity)
        :precondition (and
            (hand ?obj_0)
            (sneeze ?obj_1)
            (texture ?obj_2)
            (next ?obj_1 ?obj_2)
            (next ?obj_0 ?obj_2)
        )
        :effect (and
            (vase ?obj_0 ?obj_1)
            (not (next ?obj_0 ?obj_2))
        )
    )

    (:action wretched
        :parameters (?obj_0 ?obj_1 ?obj_2 ?obj_3 - entity)
        :precondition (and
            (sneeze ?obj_0)
            (texture ?obj_1)
            (texture ?obj_2)
            (stupendous ?obj_3)
            (next ?obj_0 ?obj_1)
            (collect ?obj_1 ?obj_3)
            (collect ?obj_2 ?obj_3)
        )
        :effect (and
            (next ?obj_0 ?obj_2)
            (not (next ?obj_0 ?obj_1))
        )
    )

    (:action memory
        :parameters (?obj_0 ?obj_1 ?obj_2 - entity)
        :precondition (and
            (cats ?obj_0)
            (spring ?obj_1)
            (spring ?obj_2)
            (next ?obj_0 ?obj_1)
        )
        :effect (and
            (next ?obj_0 ?obj_2)
            (not (next ?obj_0 ?obj_1))
        )
    )

    (:action tightfisted
        :parameters (?obj_0 ?obj_1 ?obj_2 - entity)
        :precondition (and
            (hand ?obj_0)
            (sneeze ?obj_1)
            (texture ?obj_2)
            (next ?obj_1 ?obj_2)
            (vase ?obj_0 ?obj_1)
        )
        :effect (and
            (next ?obj_0 ?obj_2)
            (not (vase ?obj_0 ?obj_1))
        )
    )
)