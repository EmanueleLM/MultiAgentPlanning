(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)

  (:predicates 
    (cats ?x)
    (collect ?x ?y)
    (hand ?x)
    (next ?x ?y)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (texture ?x)
    (vase ?x ?y)
  )

  (:action paltry
    :parameters (?object_0 ?object_1 ?object_2)
    :precondition (and (hand ?object_0) (cats ?object_1) (texture ?object_2)
                       (vase ?object_0 ?object_1) (next ?object_1 ?object_2))
    :effect (and (not (vase ?object_0 ?object_1))
                 (next ?object_0 ?object_2))
  )

  (:action sip
    :parameters (?object_0 ?object_1 ?object_2)
    :precondition (and (hand ?object_0) (cats ?object_1) (texture ?object_2)
                       (next ?object_0 ?object_2) (next ?object_1 ?object_2))
    :effect (and (vase ?object_0 ?object_1)
                 (not (next ?object_0 ?object_2)))
  )

  (:action clip
    :parameters (?object_0 ?object_1 ?object_2)
    :precondition (and (hand ?object_0) (sneeze ?object_1) (texture ?object_2)
                       (next ?object_1 ?object_2) (next ?object_0 ?object_2))
    :effect (and (vase ?object_0 ?object_1)
                 (not (next ?object_0 ?object_2)))
  )

  (:action wretched
    :parameters (?object_0 ?object_1 ?object_2 ?object_3)
    :precondition (and (sneeze ?object_0) (texture ?object_1) (texture ?object_2)
                       (stupendous ?object_3) (next ?object_0 ?object_1)
                       (collect ?object_1 ?object_3) (collect ?object_2 ?object_3))
    :effect (and (not (next ?object_0 ?object_1))
                 (next ?object_0 ?object_2))
  )

  (:action memory
    :parameters (?object_0 ?object_1 ?object_2)
    :precondition (and (cats ?object_0) (spring ?object_1) (spring ?object_2)
                       (next ?object_0 ?object_1))
    :effect (and (not (next ?object_0 ?object_1))
                 (next ?object_0 ?object_2))
  )

  (:action tightfisted
    :parameters (?object_0 ?object_1 ?object_2)
    :precondition (and (hand ?object_0) (sneeze ?object_1) (texture ?object_2)
                       (next ?object_1 ?object_2) (vase ?object_0 ?object_1))
    :effect (and (not (vase ?object_0 ?object_1))
                 (next ?object_0 ?object_2))
  )
)