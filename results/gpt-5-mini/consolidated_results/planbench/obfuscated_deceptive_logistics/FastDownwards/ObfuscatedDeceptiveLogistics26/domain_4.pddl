(define (domain obfuscated_deceptive_logistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj ?p - obj)
    (next ?o - obj ?p - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?o - obj ?p - obj)
    (spring ?o - obj)

    ;; explicit stage/time management predicates
    (stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
    (open ?s - stage)
    (used ?s - stage)
  )

  ;; All actions require consuming a current open stage ?st and opening a successor stage ?stn.
  ;; To enforce contiguous, non-oscillatory progression we require:
  ;;   - (open ?st)
  ;;   - (not (used ?st))
  ;;   - (succ ?st ?stn)
  ;;   - (not (used ?stn))
  ;;   - (not (open ?stn))
  ;; Effects always: mark ?st used, close ?st, open ?stn.

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)

      (open ?st)
      (not (used ?st))
      (succ ?st ?stn)
      (not (used ?stn))
      (not (open ?stn))
    )
    :effect (and
      ;; stage progression
      (used ?st)
      (not (open ?st))
      (open ?stn)

      ;; domain effects
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)

      (open ?st)
      (not (used ?st))
      (succ ?st ?stn)
      (not (used ?stn))
      (not (open ?stn))
    )
    :effect (and
      (used ?st)
      (not (open ?st))
      (open ?stn)

      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)

      (open ?st)
      (not (used ?st))
      (succ ?st ?stn)
      (not (used ?stn))
      (not (open ?stn))
    )
    :effect (and
      (used ?st)
      (not (open ?st))
      (open ?stn)

      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

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
      (not (used ?st))
      (succ ?st ?stn)
      (not (used ?stn))
      (not (open ?stn))
    )
    :effect (and
      (used ?st)
      (not (open ?st))
      (open ?stn)

      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?st - stage ?stn - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)

      (open ?st)
      (not (used ?st))
      (succ ?st ?stn)
      (not (used ?stn))
      (not (open ?stn))
    )
    :effect (and
      (used ?st)
      (not (open ?st))
      (open ?stn)

      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)

      (open ?st)
      (not (used ?st))
      (succ ?st ?stn)
      (not (used ?stn))
      (not (open ?stn))
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