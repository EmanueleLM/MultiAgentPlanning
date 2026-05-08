(define (domain obfuscated_deceptive_logistics3)
  :requirements :strips :typing :negative-preconditions
  :types obj

  :predicates
    (cats ?o - obj)
    (hand ?o - obj)
    (texture ?o - obj)
    (vase ?o1 ?o2 - obj)
    (next ?o1 ?o2 - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?o1 ?o2 - obj)
)

  ;; paltry: hand ?x, cats ?y, texture ?z, vase ?x ?y, next ?y ?z
  ;; effects: add next ?x ?z, delete vase ?x ?y
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
                    (hand ?x)
                    (cats ?y)
                    (texture ?z)
                    (vase ?x ?y)
                    (next ?y ?z)
                  )
    :effect (and
              (next ?x ?z)
              (not (vase ?x ?y))
            )
  )

  ;; sip: hand ?x, cats ?y, texture ?z, next ?x ?z, next ?y ?z
  ;; effects: add vase ?x ?y, delete next ?x ?z
  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
                    (hand ?x)
                    (cats ?y)
                    (texture ?z)
                    (next ?x ?z)
                    (next ?y ?z)
                  )
    :effect (and
              (vase ?x ?y)
              (not (next ?x ?z))
            )
  )

  ;; clip: hand ?x, sneeze ?y, texture ?z, next ?y ?z, next ?x ?z
  ;; effects: add vase ?x ?y, delete next ?x ?z
  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
                    (hand ?x)
                    (sneeze ?y)
                    (texture ?z)
                    (next ?y ?z)
                    (next ?x ?z)
                  )
    :effect (and
              (vase ?x ?y)
              (not (next ?x ?z))
            )
  )

  ;; wretched: sneeze ?x, texture ?y, texture ?z, stupendous ?w,
  ;;           next ?x ?y, collect ?y ?w, collect ?z ?w
  ;; effects: add next ?x ?z, delete next ?x ?y
  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj)
    :precondition (and
                    (sneeze ?x)
                    (texture ?y)
                    (texture ?z)
                    (stupendous ?w)
                    (next ?x ?y)
                    (collect ?y ?w)
                    (collect ?z ?w)
                  )
    :effect (and
              (next ?x ?z)
              (not (next ?x ?y))
            )
  )

  ;; memory: cats ?x, spring ?y, spring ?z, next ?x ?y
  ;; effects: add next ?x ?z, delete next ?x ?y
  (:action memory
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

  ;; tightfisted: hand ?x, sneeze ?y, texture ?z, next ?y ?z, vase ?x ?y
  ;; effects: add next ?x ?z, delete vase ?x ?y
  (:action tightfisted
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