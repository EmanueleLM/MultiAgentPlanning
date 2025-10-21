(define (domain depots4)
  ; Domain modeling the available actions and predicates described in the specification.
  ; Predicates: hand, cats, texture, vase, next, sneeze, spring, collect, stupendous.
  ; Actions: paltry, sip, clip, wretched, memory, tightfisted.
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (vase ?x ?y - object)
    (next ?x ?y - object)
    (sneeze ?x - object)
    (spring ?x - object)
    (collect ?x ?y - object)
    (stupendous ?x - object)
  )

  ; paltry: pre: hand X, cats Y, texture Z, vase X Y, next Y Z
  ; effects: add next X Z, delete vase X Y
  (:action paltry
    :parameters (?x ?y ?z - object)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  ; sip: pre: hand X, cats Y, texture Z, next X Z, next Y Z
  ; effects: add vase X Y, delete next X Z
  (:action sip
    :parameters (?x ?y ?z - object)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ; clip: pre: hand X, sneeze Y, texture Z, next Y Z, next X Z
  ; effects: add vase X Y, delete next X Z
  (:action clip
    :parameters (?x ?y ?z - object)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ; wretched: pre: sneeze X, texture Y, texture Z, stupendous W, next X Y, collect Y W, collect Z W
  ; effects: add next X Z, delete next X Y
  (:action wretched
    :parameters (?x ?y ?z ?w - object)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ; memory: pre: cats X, spring Y, spring Z, next X Y
  ; effects: add next X Z, delete next X Y
  (:action memory
    :parameters (?x ?y ?z - object)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ; tightfisted: pre: hand X, sneeze Y, texture Z, next Y Z, vase X Y
  ; effects: add next X Z, delete vase X Y
  (:action tightfisted
    :parameters (?x ?y ?z - object)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )
)