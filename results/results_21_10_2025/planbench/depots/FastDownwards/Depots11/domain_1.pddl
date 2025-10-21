; ===============================================================
; Domain: Depots11-reconciled
; Reconciliations and assumptions (documented for FastDownwards compatibility):
; - The domain implements exactly the public action schemas provided:
;     paltry ?x ?y ?z
;     sip ?x ?y ?z
;     clip ?x ?y ?z
;     wretched ?x ?y ?z ?w
;     memory ?x ?y ?z
;     tightfisted ?x ?y ?z
;   with preconditions and effects as specified in the input.
; - Predicates are modeled directly (hand, cats, texture, vase, next, sneeze,
;   spring, stupendous, collect) with object type "obj".
; - Requirements are limited to :strips :typing :negative-preconditions,
;   compatible with Fast Downwards.
; - No additional predicates or actions were invented; the domain enforces the
;   exact precondition/effect relationships so the provided grounded plan is a
;   natural satisfying plan for the chosen problem instance (Scenario 1).
; ===============================================================

(define (domain depots11)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
  )

  ;; paltry ?x ?y ?z
  ;; pre: hand ?x, cats ?y, texture ?z, vase ?x ?y, next ?y ?z
  ;; add: next ?x ?z
  ;; del: vase ?x ?y
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

  ;; sip ?x ?y ?z
  ;; pre: hand ?x, cats ?y, texture ?z, next ?x ?z, next ?y ?z
  ;; add: vase ?x ?y
  ;; del: next ?x ?z
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

  ;; clip ?x ?y ?z
  ;; pre: hand ?x, sneeze ?y, texture ?z, next ?y ?z, next ?x ?z
  ;; add: vase ?x ?y
  ;; del: next ?x ?z
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

  ;; wretched ?x ?y ?z ?w
  ;; pre: sneeze ?x, texture ?y, texture ?z, stupendous ?w,
  ;;      next ?x ?y, collect ?y ?w, collect ?z ?w
  ;; add: next ?x ?z
  ;; del: next ?x ?y
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

  ;; memory ?x ?y ?z
  ;; pre: cats ?x, spring ?y, spring ?z, next ?x ?y
  ;; add: next ?x ?z
  ;; del: next ?x ?y
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

  ;; tightfisted ?x ?y ?z
  ;; pre: hand ?x, sneeze ?y, texture ?z, next ?y ?z, vase ?x ?y
  ;; add: next ?x ?z
  ;; del: vase ?x ?y
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