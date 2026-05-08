(define (domain jack_of_all_trades)
    (:requirements :strips :typing :negative-preconditions)
    (:types entity)
    
    (:predicates
        (hand ?x - entity)
        (cats ?x - entity)
        (sneeze ?x - entity)
        (spring ?x - entity)
        (stupendous ?x - entity)
        (texture ?x - entity)
        (vase ?x ?y - entity)
        (next ?x ?y - entity)
        (collect ?x ?y - entity)
    )

    (:action paltry
        :parameters (?obj0 ?obj1 ?obj2 - entity)
        :precondition (and
            (hand ?obj0)
            (cats ?obj1)
            (texture ?obj2)
            (vase ?obj0 ?obj1)
            (next ?obj1 ?obj2)
        )
        :effect (and
            (next ?obj0 ?obj2)
            (not (vase ?obj0 ?obj1))
        )
    )

    (:action sip
        :parameters (?obj0 ?obj1 ?obj2 - entity)
        :precondition (and
            (hand ?obj0)
            (cats ?obj1)
            (texture ?obj2)
            (next ?obj0 ?obj2)
            (next ?obj1 ?obj2)
        )
        :effect (and
            (vase ?obj0 ?obj1)
            (not (next ?obj0 ?obj2))
        )
    )

    (:action clip
        :parameters (?obj0 ?obj1 ?obj2 - entity)
        :precondition (and
            (hand ?obj0)
            (sneeze ?obj1)
            (texture ?obj2)
            (next ?obj1 ?obj2)
            (next ?obj0 ?obj2)
        )
        :effect (and
            (vase ?obj0 ?obj1)
            (not (next ?obj0 ?obj2))
        )
    )

    (:action wretched
        :parameters (?obj0 ?obj1 ?obj2 ?obj3 - entity)
        :precondition (and
            (sneeze ?obj0)
            (texture ?obj1)
            (texture ?obj2)
            (stupendous ?obj3)
            (next ?obj0 ?obj1)
            (collect ?obj1 ?obj3)
            (collect ?obj2 ?obj3)
        )
        :effect (and
            (next ?obj0 ?obj2)
            (not (next ?obj0 ?obj1))
        )
    )

    (:action memory
        :parameters (?obj0 ?obj1 ?obj2 - entity)
        :precondition (and
            (cats ?obj0)
            (spring ?obj1)
            (spring ?obj2)
            (next ?obj0 ?obj1)
        )
        :effect (and
            (next ?obj0 ?obj2)
            (not (next ?obj0 ?obj1))
        )
    )

    (:action tightfisted
        :parameters (?obj0 ?obj1 ?obj2 - entity)
        :precondition (and
            (hand ?obj0)
            (sneeze ?obj1)
            (texture ?obj2)
            (next ?obj1 ?obj2)
            (vase ?obj0 ?obj1)
        )
        :effect (and
            (next ?obj0 ?obj2)
            (not (vase ?obj0 ?obj1))
        )
    )
)