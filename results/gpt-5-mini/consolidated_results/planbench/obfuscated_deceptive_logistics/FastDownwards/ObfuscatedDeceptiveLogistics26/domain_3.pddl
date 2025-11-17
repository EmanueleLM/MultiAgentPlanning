(define (domain obfuscated_deceptive_logistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ;; object predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj ?p - obj)
    (next ?o - obj ?p - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?o - obj ?p - obj)
    (spring ?o - obj)

    ;; explicit stage/time management to enforce ordering and contiguous use
    (stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)    ;; successor relation between stages
    (open ?s - stage)                 ;; the stage that is currently available to be used
    (used ?s - stage)                 ;; stage already consumed
  )

  ;; Stage-managed wrapper on each original action:
  ;; Every action now requires an available stage ?st and a successor stage ?stn (succ ?st ?stn).
  ;; Precondition: (open ?st) and (not (used ?st)).
  ;; Effect: consumes open ?st, marks used ?st, and opens successor ?stn.
  ;; This enforces contiguous, non-oscillatory sequencing of actions.

  ;; paltry ?h ?c ?t at stage ?st -> ?stn
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (open ?st)
      (succ ?st ?stn)
      (not (used ?st))
    )
    :effect (and
      ;; stage bookkeeping
      (used ?st)
      (not (open ?st))
      (open ?stn)

      ;; domain effects
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; sip ?h ?c ?t at stage ?st -> ?stn
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (open ?st)
      (succ ?st ?stn)
      (not (used ?st))
    )
    :effect (and
      (used ?st)
      (not (open ?st))
      (open ?stn)

      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; clip ?h ?s ?t at stage ?st -> ?stn
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
      (open ?st)
      (succ ?st ?stn)
      (not (used ?st))
    )
    :effect (and
      (used ?st)
      (not (open ?st))
      (open ?stn)

      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; wretched ?a ?b ?c ?d at stage ?st -> ?stn
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj ?st - stage ?stn - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (open ?st)
      (succ ?st ?stn)
      (not (used ?st))
    )
    :effect (and
      (used ?st)
      (not (open ?st))
      (open ?stn)

      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; memory ?c ?s1 ?s2 at stage ?st -> ?stn
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?st - stage ?stn - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (open ?st)
      (succ ?st ?stn)
      (not (used ?st))
    )
    :effect (and
      (used ?st)
      (not (open ?st))
      (open ?stn)

      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ;; tightfisted ?h ?s ?t at stage ?st -> ?stn
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
      (open ?st)
      (succ ?st ?stn)
      (not (used ?st))
    )
    :effect (and
      (used ?st)
      (not (open ?st))
      (open ?stn)

      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )

)