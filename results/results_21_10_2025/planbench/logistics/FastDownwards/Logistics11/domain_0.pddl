(define (domain integrated-domain)
  (:requirements :typing :strips)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x ?y - obj)
    (next ?x ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?x ?y - obj)
  )

  ;; Actions from planner_A (namespaced with prefix A-)
  (:action A-paltry
    :parameters (?hand - obj ?cat - obj ?tex - obj)
    :precondition (and
      (hand ?hand)
      (cats ?cat)
      (texture ?tex)
      (vase ?hand ?cat)
      (next ?cat ?tex)
    )
    :effect (and
      (next ?hand ?tex)
      (not (vase ?hand ?cat))
    )
  )

  (:action A-sip
    :parameters (?hand - obj ?cat - obj ?tex - obj)
    :precondition (and
      (hand ?hand)
      (cats ?cat)
      (texture ?tex)
      (next ?hand ?tex)
      (next ?cat ?tex)
    )
    :effect (and
      (vase ?hand ?cat)
      (not (next ?hand ?tex))
    )
  )

  (:action A-clip
    :parameters (?hand - obj ?sneezer - obj ?tex - obj)
    :precondition (and
      (hand ?hand)
      (sneeze ?sneezer)
      (texture ?tex)
      (next ?sneezer ?tex)
      (next ?hand ?tex)
    )
    :effect (and
      (vase ?hand ?sneezer)
      (not (next ?hand ?tex))
    )
  )

  ;; Actions from planner_B (namespaced with prefix B-)
  (:action B-wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  (:action B-memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  (:action B-tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )
)