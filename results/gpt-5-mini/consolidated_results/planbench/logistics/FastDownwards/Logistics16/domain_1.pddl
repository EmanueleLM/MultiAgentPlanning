(define (domain corrected_neutral_model)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    ;; static/type-like predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (sneeze ?x - object)
    (collect ?x - object ?y - object)    ; collector relation (static)
    (spring ?x - object)
    (stupendous ?x - object)

    ;; fluents that are indexed by an explicit stage to enforce temporal progression
    (next ?a - object ?b - object ?t - stage)   ; "next a b" holds at stage t
    (vase ?a - object ?b - object ?t - stage)   ; "vase a b" holds at stage t

    ;; explicit stage control (discrete time)
    (succ ?t1 - stage ?t2 - stage)              ; successor relation between stages
    (current_stage ?t - stage)                  ; exactly one current stage holds during execution
  )

  ;; Each action advances the global current_stage from ?t to its successor ?t2.
  ;; Preconditions that refer to next/vase are tied to the current stage ?t.
  ;; Effects create/delete next/vase at the successor stage ?t2. This enforces that
  ;; changes are timestamped and that the planner must progress stages contiguously.

  (:action paltry
    :parameters (?h - object ?c - object ?tx - object ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?tx)
      (vase ?h ?c ?t)          ; vase(h,c) must hold at current stage ?t
      (next ?c ?tx ?t)         ; next(c,tx) must hold at current stage ?t
      (succ ?t ?t2)
      (current_stage ?t)
    )
    :effect (and
      ;; add next(h,tx) at the new stage
      (next ?h ?tx ?t2)
      ;; ensure vase(h,c) does not hold at the new stage
      (not (vase ?h ?c ?t2))
      ;; advance global stage
      (not (current_stage ?t))
      (current_stage ?t2)
    )
  )

  (:action sip
    :parameters (?h - object ?c - object ?tx - object ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?tx)
      (next ?h ?tx ?t)
      (next ?c ?tx ?t)
      (succ ?t ?t2)
      (current_stage ?t)
    )
    :effect (and
      ;; establish vase(h,c) at new stage
      (vase ?h ?c ?t2)
      ;; remove next(h,tx) at the new stage (so it's no longer true at the current time)
      (not (next ?h ?tx ?t2))
      ;; advance stage
      (not (current_stage ?t))
      (current_stage ?t2)
    )
  )

  (:action clip
    :parameters (?h - object ?s - object ?tx - object ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?tx)
      (next ?s ?tx ?t)
      (next ?h ?tx ?t)
      (succ ?t ?t2)
      (current_stage ?t)
    )
    :effect (and
      ;; establish vase(h,s) at new stage
      (vase ?h ?s ?t2)
      ;; remove next(h,tx) at the new stage
      (not (next ?h ?tx ?t2))
      ;; advance stage
      (not (current_stage ?t))
      (current_stage ?t2)
    )
  )

  (:action wretched
    :parameters (?s - object ?t1 - object ?t2 - object ?collector - object ?t - stage ?t2s - stage)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?collector)
      (next ?s ?t1 ?t)
      (collect ?t1 ?collector)
      (collect ?t2 ?collector)
      (succ ?t ?t2s)
      (current_stage ?t)
    )
    :effect (and
      ;; move next(s, t1) -> next(s, t2) at successor stage
      (next ?s ?t2 ?t2s)
      (not (next ?s ?t1 ?t2s))
      ;; advance stage
      (not (current_stage ?t))
      (current_stage ?t2s)
    )
  )

  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object ?t - stage ?t2 - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1 ?t)
      (succ ?t ?t2)
      (current_stage ?t)
    )
    :effect (and
      ;; move next(c,s1) -> next(c,s2) at successor stage
      (next ?c ?s2 ?t2)
      (not (next ?c ?s1 ?t2))
      ;; advance stage
      (not (current_stage ?t))
      (current_stage ?t2)
    )
  )

  (:action tightfisted
    :parameters (?h - object ?s - object ?tx - object ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?tx)
      (next ?s ?tx ?t)
      (vase ?h ?s ?t)
      (succ ?t ?t2)
      (current_stage ?t)
    )
    :effect (and
      ;; establish next(h,tx) at successor stage
      (next ?h ?tx ?t2)
      ;; remove vase(h,s) at successor stage
      (not (vase ?h ?s ?t2))
      ;; advance stage
      (not (current_stage ?t))
      (current_stage ?t2)
    )
  )

)