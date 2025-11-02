(define (domain multiagent_vases)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
  )

  ;; Actions as provided by the player's analysis.
  (:action paltry
    :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
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
    :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
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
    :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
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
    :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj ?obj3 - obj)
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
    :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
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
    :parameters (?obj0 - obj ?obj1 - obj ?obj2 - obj)
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