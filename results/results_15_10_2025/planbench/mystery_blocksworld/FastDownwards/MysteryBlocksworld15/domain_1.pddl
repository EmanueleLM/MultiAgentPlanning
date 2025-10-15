(define (domain mystery_blocksworld15)
  (:requirements :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (sneeze ?x - object)
    (spring ?x - object)
    (stupendous ?x - object)
    (collect ?x - object ?y - object)
    (next ?x - object ?y - object)
    (vase ?x - object ?y - object)
  )

  (:action paltry
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  (:action sip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  (:action clip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?w - object)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  (:action memory
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )
)