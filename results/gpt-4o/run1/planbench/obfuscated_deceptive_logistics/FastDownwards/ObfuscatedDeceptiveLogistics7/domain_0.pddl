(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  
  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (sneeze ?x - object)
    (texture ?x - object)
    (stupendous ?x - object)
    (spring ?x - object)
    (collect ?x ?y - object)
    (next ?x ?y - object)
    (vase ?x ?y - object)
  )
  
  (:action paltry
    :parameters (?object_0 ?object_1 ?object_2 - object)
    :precondition (and
      (hand ?object_0)
      (cats ?object_1)
      (texture ?object_2)
      (vase ?object_0 ?object_1)
      (next ?object_1 ?object_2)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (vase ?object_0 ?object_1))
    )
  )
  
  (:action sip
    :parameters (?object_0 ?object_1 ?object_2 - object)
    :precondition (and
      (hand ?object_0)
      (cats ?object_1)
      (texture ?object_2)
      (next ?object_0 ?object_2)
      (next ?object_1 ?object_2)
    )
    :effect (and
      (vase ?object_0 ?object_1)
      (not (next ?object_0 ?object_2))
    )
  )
  
  (:action clip
    :parameters (?object_0 ?object_1 ?object_2 - object)
    :precondition (and
      (hand ?object_0)
      (sneeze ?object_1)
      (texture ?object_2)
      (next ?object_1 ?object_2)
      (next ?object_0 ?object_2)
    )
    :effect (and
      (vase ?object_0 ?object_1)
      (not (next ?object_0 ?object_2))
    )
  )
  
  (:action wretched
    :parameters (?object_0 ?object_1 ?object_2 ?object_3 - object)
    :precondition (and
      (sneeze ?object_0)
      (texture ?object_1)
      (texture ?object_2)
      (stupendous ?object_3)
      (next ?object_0 ?object_1)
      (collect ?object_1 ?object_3)
      (collect ?object_2 ?object_3)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
    )
  )
  
  (:action memory
    :parameters (?object_0 ?object_1 ?object_2 - object)
    :precondition (and
      (cats ?object_0)
      (spring ?object_1)
      (spring ?object_2)
      (next ?object_0 ?object_1)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
    )
  )
  
  (:action tightfisted
    :parameters (?object_0 ?object_1 ?object_2 - object)
    :precondition (and
      (hand ?object_0)
      (sneeze ?object_1)
      (texture ?object_2)
      (next ?object_1 ?object_2)
      (vase ?object_0 ?object_1)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (vase ?object_0 ?object_1))
    )
  )
)