(define (domain logistics10)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    ;; static unary predicates describing object categories
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)

    ;; static binary relation
    (collect ?a - object ?b - object)

    ;; temporal successor relation over stages (static)
    (succ ?s1 - stage ?s2 - stage)

    ;; dynamic relations parameterized by stage
    (next ?x - object ?y - object ?s - stage)
    (vase ?x - object ?y - object ?s - stage)
  )

  ;; paltry:
  ;; pre: hand ?h, cats ?c, texture ?t, vase ?h ?c at S, next ?c ?t at S, succ S S2
  ;; add: next ?h ?t at S2
  ;; del: vase ?h ?c at S
  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c ?s)
      (next ?c ?t ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t ?s2)
      (not (vase ?h ?c ?s))
    )
  )

  ;; sip:
  ;; pre: hand ?h, cats ?c, texture ?t, next ?h ?t at S, next ?c ?t at S, succ S S2
  ;; add: vase ?h ?c at S2
  ;; del: next ?h ?t at S
  (:action sip
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t ?s)
      (next ?c ?t ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?c ?s2)
      (not (next ?h ?t ?s))
    )
  )

  ;; clip:
  ;; pre: hand ?h, sneeze ?sobj, texture ?t, next ?sobj ?t at S, next ?h ?t at S, succ S S2
  ;; add: vase ?h ?sobj at S2
  ;; del: next ?h ?t at S
  (:action clip
    :parameters (?h - object ?sobj - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sobj)
      (texture ?t)
      (next ?sobj ?t ?s)
      (next ?h ?t ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?sobj ?s2)
      (not (next ?h ?t ?s))
    )
  )

  ;; wretched:
  ;; pre: sneeze ?sobj, texture ?t1, texture ?t2, stupendous ?st,
  ;;      next ?sobj ?t1 at S, collect ?t1 ?st, collect ?t2 ?st, succ S S2
  ;; add: next ?sobj ?t2 at S2
  ;; del: next ?sobj ?t1 at S
  (:action wretched
    :parameters (?sobj - object ?t1 - object ?t2 - object ?st - object ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?sobj)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?sobj ?t1 ?s)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?sobj ?t2 ?s2)
      (not (next ?sobj ?t1 ?s))
    )
  )

  ;; memory:
  ;; pre: cats ?c, spring ?sp1, spring ?sp2, next ?c ?sp1 at S, succ S S2
  ;; add: next ?c ?sp2 at S2
  ;; del: next ?c ?sp1 at S
  (:action memory
    :parameters (?c - object ?sp1 - object ?sp2 - object ?s - stage ?s2 - stage)
    :precondition (and
      (cats ?c)
      (spring ?sp1)
      (spring ?sp2)
      (next ?c ?sp1 ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?c ?sp2 ?s2)
      (not (next ?c ?sp1 ?s))
    )
  )

  ;; tightfisted:
  ;; pre: hand ?h, sneeze ?sobj, texture ?t, next ?sobj ?t at S, vase ?h ?sobj at S, succ S S2
  ;; add: next ?h ?t at S2
  ;; del: vase ?h ?sobj at S
  (:action tightfisted
    :parameters (?h - object ?sobj - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sobj)
      (texture ?t)
      (next ?sobj ?t ?s)
      (vase ?h ?sobj ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t ?s2)
      (not (vase ?h ?sobj ?s))
    )
  )
)