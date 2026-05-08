(define (domain obfuscated_deceptive_logistics_12)
  (:requirements :strips)
  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (vase ?x ?y)
    (next ?x ?y)
    (sneeze ?x)
    (stupendous ?x)
    (collect ?x ?y)
    (spring ?x)
  )

  (:action paltry
    :parameters (?obj0 ?obj1 ?obj2)
    :precondition (and (hand ?obj0) (cats ?obj1) (texture ?obj2) (vase ?obj0 ?obj1) (next ?obj1 ?obj2))
    :effect (and (next ?obj0 ?obj2) (not (vase ?obj0 ?obj1)))
  )

  (:action sip
    :parameters (?obj0 ?obj1 ?obj2)
    :precondition (and (hand ?obj0) (cats ?obj1) (texture ?obj2) (next ?obj0 ?obj2) (next ?obj1 ?obj2))
    :effect (and (vase ?obj0 ?obj1) (not (next ?obj0 ?obj2)))
  )

  (:action clip
    :parameters (?obj0 ?obj1 ?obj2)
    :precondition (and (hand ?obj0) (sneeze ?obj1) (texture ?obj2) (next ?obj1 ?obj2) (next ?obj0 ?obj2))
    :effect (and (vase ?obj0 ?obj1) (not (next ?obj0 ?obj2)))
  )

  (:action wretched
    :parameters (?obj0 ?obj1 ?obj2 ?obj3)
    :precondition (and (sneeze ?obj0) (texture ?obj1) (texture ?obj2) (stupendous ?obj3) (next ?obj0 ?obj1) (collect ?obj1 ?obj3) (collect ?obj2 ?obj3))
    :effect (and (next ?obj0 ?obj2) (not (next ?obj0 ?obj1)))
  )

  (:action memory
    :parameters (?obj0 ?obj1 ?obj2)
    :precondition (and (cats ?obj0) (spring ?obj1) (spring ?obj2) (next ?obj0 ?obj1))
    :effect (and (next ?obj0 ?obj2) (not (next ?obj0 ?obj1)))
  )

  (:action tightfisted
    :parameters (?obj0 ?obj1 ?obj2)
    :precondition (and (hand ?obj0) (sneeze ?obj1) (texture ?obj2) (next ?obj1 ?obj2) (vase ?obj0 ?obj1))
    :effect (and (next ?obj0 ?obj2) (not (vase ?obj0 ?obj1)))
  )
)