(define (domain multiagent-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj phase)

  (:predicates
    ; unary properties
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)

    ; binary relations
    (collect ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)

    ; explicit stage progression
    (current-phase ?p - phase)
    (phase-next ?p1 - phase ?p2 - phase)
  )

  ;; Each action requires the timeline to be at some phase ?pf and moves it to the successor phase ?pt.
  ;; This enforces a strict, non-oscillating, forward-only ordering: actions consume the current phase
  ;; and produce its successor. No action produces a previous phase.

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?pf - phase ?pt - phase)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (current-phase ?pf)
      (phase-next ?pf ?pt)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (current-phase ?pf))
      (current-phase ?pt)
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?pf - phase ?pt - phase)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current-phase ?pf)
      (phase-next ?pf ?pt)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (current-phase ?pf))
      (current-phase ?pt)
    )
  )

  (:action clip
    :parameters (?h - obj ?snee - obj ?t - obj ?pf - phase ?pt - phase)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texture ?t)
      (next ?snee ?t)
      (next ?h ?t)
      (current-phase ?pf)
      (phase-next ?pf ?pt)
    )
    :effect (and
      (vase ?h ?snee)
      (not (next ?h ?t))
      (not (current-phase ?pf))
      (current-phase ?pt)
    )
  )

  (:action wretched
    :parameters (?snee - obj ?t1 - obj ?t2 - obj ?st - obj ?pf - phase ?pt - phase)
    :precondition (and
      (sneeze ?snee)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?snee ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
      (current-phase ?pf)
      (phase-next ?pf ?pt)
    )
    :effect (and
      (next ?snee ?t2)
      (not (next ?snee ?t1))
      (not (current-phase ?pf))
      (current-phase ?pt)
    )
  )

  (:action memory
    :parameters (?c - obj ?sp1 - obj ?sp2 - obj ?pf - phase ?pt - phase)
    :precondition (and
      (cats ?c)
      (spring ?sp1)
      (spring ?sp2)
      (next ?c ?sp1)
      (current-phase ?pf)
      (phase-next ?pf ?pt)
    )
    :effect (and
      (next ?c ?sp2)
      (not (next ?c ?sp1))
      (not (current-phase ?pf))
      (current-phase ?pt)
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?snee - obj ?t - obj ?pf - phase ?pt - phase)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texture ?t)
      (next ?snee ?t)
      (vase ?h ?snee)
      (current-phase ?pf)
      (phase-next ?pf ?pt)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?snee))
      (not (current-phase ?pf))
      (current-phase ?pt)
    )
  )
)