(define (domain logistics_objects)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (sneeze ?x - object)
    (stupendous ?x - object)
    (texture ?x - object)
    (spring ?x - object)

    (vase ?x - object ?y - object)
    (next ?x - object ?y - object)
    (collect ?x - object ?y - object)

    (now ?t - stage)
    (succ ?t1 - stage ?t2 - stage)
  )

  (:action paltry
    :parameters (?x - object ?y - object ?z - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (now ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action sip
    :parameters (?x - object ?y - object ?z - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
      (now ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action clip
    :parameters (?x - object ?y - object ?z - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
      (now ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?w - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
      (now ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action memory
    :parameters (?x - object ?y - object ?z - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
      (now ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (now ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (now ?t1))
      (now ?t2)
    )
  )
)