(define (domain obfuscated-deceptive-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    stage
  )

  (:predicates
    ;; unary type-like predicates used as preconditions/effects
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (spring ?o - object)

    ;; binary relations
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (collect ?o1 - object ?o2 - object)

    ;; discrete-stage progression
    (succ ?s1 - stage ?s2 - stage)
    (now ?s - stage)
  )

  ;; Every action requires the current stage (?from) and its direct successor (?to).
  ;; We also require that the target stage is not already current to enforce contiguous progression.
  ;; paltry action: requires hand, cats, texture, vase and next; produces next and removes vase
  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
      (not (now ?to))
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (now ?from))
      (now ?to)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ;; sip action: requires hand, cats, texture, next(o0,o2) and next(o1,o2);
  ;; sets vase(o0,o1) and removes next(o0,o2)
  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
      (not (now ?to))
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (now ?from))
      (now ?to)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; clip action: requires hand, sneeze, texture, next(o1,o2) and next(o0,o2);
  ;; sets vase(o0,o1) and removes next(o0,o2)
  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
      (not (now ?to))
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (not (now ?from))
      (now ?to)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; wretched action: requires sneeze, two textures, stupendous, next(o0,o1), and collects of o1 and o2 into o3;
  ;; sets next(o0,o2) and removes next(o0,o1)
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
      (not (now ?to))
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (not (now ?from))
      (now ?to)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; memory action: requires cats, two springs, and next(o0,o1); sets next(o0,o2) and removes next(o0,o1)
  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
      (not (now ?to))
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (now ?from))
      (now ?to)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; tightfisted action: requires hand, sneeze, texture, next(o1,o2), and vase(o0,o1);
  ;; sets next(o0,o2) and removes vase(o0,o1)
  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
      (not (now ?to))
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (not (now ?from))
      (now ?to)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)