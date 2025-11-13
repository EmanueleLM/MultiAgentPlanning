(define (domain ObfuscatedDeceptiveLogistics25)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    hand sneeze stupendous cat phase - obj
  )

  (:predicates
    (texture ?o - obj)
    (spring ?o - obj)
    (collect ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (vase ?a - obj ?b - obj)
    (at-phase ?p - phase)
    (phase-succ ?p - phase ?q - phase)
  )

  ;; paltry: hand ?o0, cat ?o1, texture ?o2, vase ?o0 ?o1, next ?o1 ?o2
  ;; advances phase: deletes current at-phase and adds successor
  (:action paltry
    :parameters (?o0 - hand ?o1 - cat ?o2 - obj ?p - phase ?q - phase)
    :precondition (and
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (at-phase ?p)
      (phase-succ ?p ?q)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (at-phase ?p))
      (at-phase ?q)
    )
  )

  ;; sip: hand ?o0, cat ?o1, texture ?o2, next ?o0 ?o2, next ?o1 ?o2
  ;; produces vase ?o0 ?o1 and deletes next ?o0 ?o2
  (:action sip
    :parameters (?o0 - hand ?o1 - cat ?o2 - obj ?p - phase ?q - phase)
    :precondition (and
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (at-phase ?p)
      (phase-succ ?p ?q)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (at-phase ?p))
      (at-phase ?q)
    )
  )

  ;; clip: hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, next ?o0 ?o2
  ;; produces vase ?o0 ?o1 and deletes next ?o0 ?o2
  (:action clip
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - obj ?p - phase ?q - phase)
    :precondition (and
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (at-phase ?p)
      (phase-succ ?p ?q)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (at-phase ?p))
      (at-phase ?q)
    )
  )

  ;; wretched: sneeze ?o0, texture ?o1, texture ?o2, stupendous ?o3,
  ;;           next ?o0 ?o1, collect ?o1 ?o3, collect ?o2 ?o3
  ;; adds next ?o0 ?o2 and deletes next ?o0 ?o1
  (:action wretched
    :parameters (?o0 - sneeze ?o1 - obj ?o2 - obj ?o3 - stupendous ?p - phase ?q - phase)
    :precondition (and
      (texture ?o1)
      (texture ?o2)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (at-phase ?p)
      (phase-succ ?p ?q)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (at-phase ?p))
      (at-phase ?q)
    )
  )

  ;; memory: cats ?o0, spring ?o1, spring ?o2, next ?o0 ?o1
  ;; adds next ?o0 ?o2 and deletes next ?o0 ?o1
  (:action memory
    :parameters (?o0 - cat ?o1 - obj ?o2 - obj ?p - phase ?q - phase)
    :precondition (and
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (at-phase ?p)
      (phase-succ ?p ?q)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (at-phase ?p))
      (at-phase ?q)
    )
  )

  ;; tightfisted: hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, vase ?o0 ?o1
  ;; adds next ?o0 ?o2 and deletes vase ?o0 ?o1
  (:action tightfisted
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - obj ?p - phase ?q - phase)
    :precondition (and
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (at-phase ?p)
      (phase-succ ?p ?q)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (at-phase ?p))
      (at-phase ?q)
    )
  )
)