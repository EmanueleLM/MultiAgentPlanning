(define (domain multiagent-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ;; static unary/object properties (assumed not time-indexed)
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (collect ?x - obj ?y - obj)
    (stupendous ?o - obj)

    ;; time-indexed, mutable relations
    (next ?x - obj ?y - obj ?s - stage)    ;; next relation at stage s
    (vase ?x - obj ?y - obj ?s - stage)    ;; vase relation at stage s

    ;; stage bookkeeping
    (now ?s - stage)                       ;; current stage marker
    (succ ?s1 - stage ?s2 - stage)         ;; successor relation between stages
  )

  ;; Each action operates at the current stage ?s and produces a successor stage ?s2
  ;; by requiring (now ?s) and (succ ?s ?s2) and switching the "now" marker to ?s2.
  ;; Effects described in the human specification are applied between stages:
  ;; - facts listed as becoming true are added at ?s2
  ;; - facts listed as becoming false are explicitly removed at ?s2
  ;; Note: predicates not mentioned in an action are not automatically carried forward;
  ;; if continuity is required it must be produced by action effects (this enforces
  ;; explicit, non-oscillating transitions).

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c ?s)        ;; vase(h,c) must hold at current stage
      (next ?c ?t ?s)        ;; next(c,t) at current stage
    )
    :effect (and
      ;; advance stage
      (not (now ?s))
      (now ?s2)

      ;; effects specified by the human schema:
      ;; once paltry is performed the following facts will be true: next h t
      (next ?h ?t ?s2)

      ;; once paltry is performed the following facts will be false: vase h c
      (not (vase ?h ?c ?s2))
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?x ?y ?s)         ;; next(x,y) at current stage
      (next ?c ?y ?s)         ;; next(c,y) at current stage (schema requires next object_1 object_2)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      ;; once sip is performed the following facts will be true: vase h c
      (vase ?h ?c ?s2)

      ;; once sip is performed the following facts will be false: next x y
      (not (next ?x ?y ?s2))
    )
  )

  (:action clip
    :parameters (?h - obj ?snee - obj ?t - obj ?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (sneeze ?snee)
      (texture ?t)
      (next ?x ?y ?s)
      (next ?h ?y ?s)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      ;; effects from schema:
      ;; creates vase h ? (true)
      (vase ?h ?snee ?s2)

      ;; removes next h ?y (false)
      (not (next ?h ?y ?s2))
    )
  )

  (:action wretched
    :parameters (?snee - obj ?t - obj ?st - obj ?x - obj ?y - obj ?c1 - obj ?c2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (sneeze ?snee)
      (texture ?t)
      (stupendous ?st)
      (next ?x ?y ?s)
      (collect ?y ?c1)       ;; collect object_1 object_3 in schema (interpreted as collect y c1)
      (collect ?c2 ?c1)      ;; collect object_2 object_3 in schema (interpreted as collect c2 c1)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      ;; once wretched is performed the following facts will be true: next x ?(z)
      (next ?x ?c2 ?s2)

      ;; once wretched is performed the following facts will be false: next x y
      (not (next ?x ?y ?s2))
    )
  )

  (:action memory
    :parameters (?c - obj ?sp - obj ?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (cats ?c)
      (spring ?sp)
      (next ?x ?y ?s)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      ;; once memory is performed the following facts will be true: next x z
      (next ?x ?sp ?s2)

      ;; once memory is performed the following facts will be false: next x y
      (not (next ?x ?y ?s2))
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?snee - obj ?t - obj ?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (sneeze ?snee)
      (texture ?t)
      (next ?x ?y ?s)
      (vase ?h ?snee ?s)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      ;; once tightfisted is performed the following facts will be true: next h y
      (next ?h ?y ?s2)

      ;; once tightfisted is performed the following facts will be false: vase h sneeze
      (not (vase ?h ?snee ?s2))
    )
  )
)