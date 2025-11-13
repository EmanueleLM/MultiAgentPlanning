(define (domain ObfuscatedDeceptiveLogistics6)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?a - object ?b - object)
    (spring ?o - object)
    ;; explicit stage/time bookkeeping to enforce ordering and contiguous stage occupancy
    (stage-open ?s - stage)
    (stage-used ?s - stage)
    (succ ?s - stage ?t - stage)
  )

  ;; Every action requires consuming a currently open stage and opening its successor stage.
  ;; This enforces explicit sequential ordering of actions (no slack tokens or post-hoc fixes).
  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?s - stage ?snext - stage)
    :precondition (and
      (stage-open ?s)
      (succ ?s ?snext)

      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      ;; stage progression
      (not (stage-open ?s))
      (stage-used ?s)
      (stage-open ?snext)

      ;; domain effects
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - object ?c - object ?t - object ?s - stage ?snext - stage)
    :precondition (and
      (stage-open ?s)
      (succ ?s ?snext)

      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      ;; stage progression
      (not (stage-open ?s))
      (stage-used ?s)
      (stage-open ?snext)

      ;; domain effects
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  (:action clip
    :parameters (?h - object ?sobj - object ?t - object ?stage - stage ?stagenext - stage)
    :precondition (and
      (stage-open ?stage)
      (succ ?stage ?stagenext)

      (hand ?h)
      (sneeze ?sobj)
      (texture ?t)
      (next ?sobj ?t)
      (next ?h ?t)
    )
    :effect (and
      ;; stage progression
      (not (stage-open ?stage))
      (stage-used ?stage)
      (stage-open ?stagenext)

      ;; domain effects
      (vase ?h ?sobj)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?sobj - object ?t1 - object ?t2 - object ?sp - object ?stage - stage ?stagenext - stage)
    :precondition (and
      (stage-open ?stage)
      (succ ?stage ?stagenext)

      (sneeze ?sobj)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?sp)
      (next ?sobj ?t1)
      (collect ?t1 ?sp)
      (collect ?t2 ?sp)
    )
    :effect (and
      ;; stage progression
      (not (stage-open ?stage))
      (stage-used ?stage)
      (stage-open ?stagenext)

      ;; domain effects
      (next ?sobj ?t2)
      (not (next ?sobj ?t1))
    )
  )

  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object ?stage - stage ?stagenext - stage)
    :precondition (and
      (stage-open ?stage)
      (succ ?stage ?stagenext)

      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      ;; stage progression
      (not (stage-open ?stage))
      (stage-used ?stage)
      (stage-open ?stagenext)

      ;; domain effects
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  (:action tightfisted
    :parameters (?h - object ?sobj - object ?t - object ?stage - stage ?stagenext - stage)
    :precondition (and
      (stage-open ?stage)
      (succ ?stage ?stagenext)

      (hand ?h)
      (sneeze ?sobj)
      (texture ?t)
      (next ?sobj ?t)
      (vase ?h ?sobj)
    )
    :effect (and
      ;; stage progression
      (not (stage-open ?stage))
      (stage-used ?stage)
      (stage-open ?stagenext)

      ;; domain effects
      (next ?h ?t)
      (not (vase ?h ?sobj))
    )
  )
)