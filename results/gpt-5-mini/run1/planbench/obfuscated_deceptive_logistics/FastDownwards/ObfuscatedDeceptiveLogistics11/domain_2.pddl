(define (domain obfuscated_deceptive_logistics11)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?x - object ?y - object)
    (next ?x - object ?y - object)
    (has_next ?x - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?x - object ?y - object)
    (spring ?o - object)
  )

  ;; paltry: create a next link from ?x to ?z (requires ?x currently has no next)
  (:action paltry
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (not (has_next ?x))
    )
    :effect (and
      (next ?x ?z)
      (has_next ?x)
      (not (vase ?x ?y))
    )
  )

  ;; sip: consume an existing next from ?x to ?z and create vase ?x ?y
  (:action sip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
      (has_next ?x)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (has_next ?x))
    )
  )

  ;; clip: consume an existing next from ?x to ?z and create vase ?x ?y
  (:action clip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
      (has_next ?x)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (has_next ?x))
    )
  )

  ;; wretched: replace next ?x ?y by next ?x ?z (requires collections linking y and z to same collector)
  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?w - object)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
      (has_next ?x)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      ;; has_next remains true (replacement)
    )
  )

  ;; memory: replace next ?x ?y by next ?x ?z (requires springs and cats)
  (:action memory
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
      (has_next ?x)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      ;; has_next remains true (replacement)
    )
  )

  ;; tightfisted: create a next link from ?x to ?z (requires vase and that ?x currently has no next)
  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (not (has_next ?x))
    )
    :effect (and
      (next ?x ?z)
      (has_next ?x)
      (not (vase ?x ?y))
    )
  )

)