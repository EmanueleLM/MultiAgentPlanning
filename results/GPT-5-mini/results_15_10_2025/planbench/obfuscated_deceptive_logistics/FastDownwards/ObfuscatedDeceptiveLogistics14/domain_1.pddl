(define (domain multi-agent-next)
  (:requirements :typing)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (collect ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  (:action paltry
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
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
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
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
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
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
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object ?obj3 - object)
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
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
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
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
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