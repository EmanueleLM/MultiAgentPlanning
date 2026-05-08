(define (domain obfuscated_deceptive_logistics10)
  ;; Instance-specific domain for ObfuscatedDeceptiveLogistics10
  ;; Conservative encoding faithful to the supplied action descriptions.
  ;; Notes:
  ;; - This domain is intentionally small and grounded in the provided
  ;;   predicates and action semantics. It preserves object identities
  ;;   exactly as in the specification.
  ;; - We do not invent additional objects, relations, or routes.
  (:requirements :strips :negative-preconditions :typing)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?a - obj ?b - obj)    ; vase relation between two objects
    (next ?a - obj ?b - obj)    ; successor/connectivity relation
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?a - obj ?b - obj)
  )

  ;; paltry: (?h ?c ?t)
  ;; pre: hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ;; add: next ?h ?t
  ;; del: vase ?h ?c
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; sip: (?h ?c ?t)
  ;; pre: hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t
  ;; add: vase ?h ?c
  ;; del: next ?h ?t
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; clip: (?h ?s ?t)
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t
  ;; add: vase ?h ?s
  ;; del: next ?h ?t
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; wretched: (?s ?t1 ?t2 ?sp)
  ;; pre: sneeze ?s, texture ?t1, texture ?t2, stupendous ?sp,
  ;;      next ?s ?t1, collect ?t1 ?sp, collect ?t2 ?sp
  ;; add: next ?s ?t2
  ;; del: next ?s ?t1
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?sp - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?sp)
      (next ?s ?t1)
      (collect ?t1 ?sp)
      (collect ?t2 ?sp)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; memory: (?c ?s1 ?s2)
  ;; pre: cats ?c, spring ?s1, spring ?s2, next ?c ?s1
  ;; add: next ?c ?s2
  ;; del: next ?c ?s1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ;; tightfisted: (?h ?s ?t)
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s
  ;; add: next ?h ?t
  ;; del: vase ?h ?s
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)