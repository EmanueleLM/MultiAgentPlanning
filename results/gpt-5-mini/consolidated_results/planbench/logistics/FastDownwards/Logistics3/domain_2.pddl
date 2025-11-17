(define (domain multiagent-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ;; static unary/object properties
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (collect ?x - obj ?y - obj)
    (stupendous ?o - obj)

    ;; time-indexed, mutable relations
    (next ?x - obj ?y - obj ?s - stage)
    (vase ?x - obj ?y - obj ?s - stage)

    ;; stage bookkeeping
    (now ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Each action advances from the current stage ?s to its successor ?s2.
  ;; Preconditions reference facts at stage ?s; effects add/remove facts at stage ?s2.
  ;; Predicates not mentioned in an action are NOT carried forward implicitly.

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?s2 - stage)
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
      (not (now ?s))
      (now ?s2)

      ;; produced and removed at successor stage
      (next ?h ?t ?s2)
      (not (vase ?h ?c ?s2))
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?y ?s)        ;; next(h,y) at current stage (object_0 object_2)
      (next ?c ?y ?s)        ;; next(c,y) at current stage (object_1 object_2)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      (vase ?h ?c ?s2)
      (not (next ?h ?y ?s2))
    )
  )

  (:action clip
    :parameters (?h - obj ?snee - obj ?t - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (sneeze ?snee)
      (texture ?t)
      (next ?snee ?y ?s)     ;; next(object_1, object_2)
      (next ?h ?y ?s)        ;; next(object_0, object_2)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      (vase ?h ?snee ?s2)
      (not (next ?h ?y ?s2))
    )
  )

  (:action wretched
    :parameters (?snee - obj ?t1 - obj ?t2 - obj ?st - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (sneeze ?snee)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?snee ?t1 ?s)    ;; next(object_0, object_1)
      (collect ?t1 ?st)      ;; collect(object_1, object_3)
      (collect ?t2 ?st)      ;; collect(object_2, object_3)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      (next ?snee ?t2 ?s2)   ;; sets next(object_0, object_2)
      (not (next ?snee ?t1 ?s2))
    )
  )

  (:action memory
    :parameters (?c - obj ?sp1 - obj ?sp2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (cats ?c)
      (spring ?sp1)
      (spring ?sp2)
      (next ?c ?sp1 ?s)      ;; next(c, sp1) at current stage
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      (next ?c ?sp2 ?s2)
      (not (next ?c ?sp1 ?s2))
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?snee - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (sneeze ?snee)
      (texture ?t)
      (next ?snee ?t ?s)     ;; next(object_1, object_2)
      (vase ?h ?snee ?s)     ;; vase(object_0, object_1)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      (next ?h ?t ?s2)
      (not (vase ?h ?snee ?s2))
    )
  )
)