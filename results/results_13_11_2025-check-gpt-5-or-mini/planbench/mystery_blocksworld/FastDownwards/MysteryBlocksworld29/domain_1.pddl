(define (domain MysteryBlocksworld29)
  (:requirements :strips)
  (:predicates
    (cats ?x)
    (hand ?x)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (texture ?x)
    (collect ?x ?y)
    (vase ?x ?y)
    (next ?x ?y)
  )

  (:action Paltry
    :parameters (?x ?y ?z)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z))
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y)))
  )

  (:action Sip
    :parameters (?x ?y ?z)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z))
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z)))
  )

  (:action Clip
    :parameters (?x ?y ?z)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z))
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z)))
  )

  (:action Wretched
    :parameters (?a ?b ?c ?d)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d))
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b)))
  )

  (:action Memory
    :parameters (?x ?y ?z)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y))
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y)))
  )

  (:action Tightfisted
    :parameters (?x ?y ?z)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y))
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y)))
  )
)