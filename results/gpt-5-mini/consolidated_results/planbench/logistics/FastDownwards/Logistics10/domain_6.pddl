(define (domain logistics10)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (collect ?x - object ?y - object)
    (spring ?o - object)
    (stupendous ?o - object)

    ;; temporal successor relation (static ordering of stages)
    (succ ?s1 - stage ?s2 - stage)

    ;; dynamic relations indexed by stage
    (next_at ?x - object ?y - object ?s - stage)
    (vase_at ?x - object ?y - object ?s - stage)
  )

  ;; paltry:
  ;; pre: hand H, cats C, texture T, vase_at H C at S, next_at C T at S, succ S S2
  ;; add: next_at H T at S2
  ;; del: vase_at H C at S
  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase_at ?h ?c ?s)
      (next_at ?c ?t ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next_at ?h ?t ?s2)
      (not (vase_at ?h ?c ?s))
    )
  )

  ;; sip:
  ;; pre: hand H, cats C, texture T, next_at H T at S, next_at C T at S, succ S S2
  ;; add: vase_at H C at S2
  ;; del: next_at H T at S
  (:action sip
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next_at ?h ?t ?s)
      (next_at ?c ?t ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase_at ?h ?c ?s2)
      (not (next_at ?h ?t ?s))
    )
  )

  ;; clip:
  ;; pre: hand H, sneeze SOBJ, texture T, next_at SOBJ T at S, next_at H T at S, succ S S2
  ;; add: vase_at H SOBJ at S2
  ;; del: next_at H T at S
  (:action clip
    :parameters (?h - object ?sobj - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sobj)
      (texture ?t)
      (next_at ?sobj ?t ?s)
      (next_at ?h ?t ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase_at ?h ?sobj ?s2)
      (not (next_at ?h ?t ?s))
    )
  )

  ;; wretched:
  ;; pre: sneeze SOBJ, texture T1, texture T2, stupendous ST, next_at SOBJ T1 at S,
  ;;      collect T1 ST, collect T2 ST, succ S S2
  ;; add: next_at SOBJ T2 at S2
  ;; del: next_at SOBJ T1 at S
  (:action wretched
    :parameters (?sobj - object ?t1 - object ?t2 - object ?st - object ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?sobj)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next_at ?sobj ?t1 ?s)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
      (succ ?s ?s2)
    )
    :effect (and
      (next_at ?sobj ?t2 ?s2)
      (not (next_at ?sobj ?t1 ?s))
    )
  )

  ;; memory:
  ;; pre: cats C, spring SP1, spring SP2, next_at C SP1 at S, succ S S2
  ;; add: next_at C SP2 at S2
  ;; del: next_at C SP1 at S
  (:action memory
    :parameters (?c - object ?sp1 - object ?sp2 - object ?s - stage ?s2 - stage)
    :precondition (and
      (cats ?c)
      (spring ?sp1)
      (spring ?sp2)
      (next_at ?c ?sp1 ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next_at ?c ?sp2 ?s2)
      (not (next_at ?c ?sp1 ?s))
    )
  )

  ;; tightfisted:
  ;; pre: hand H, sneeze SOBJ, texture T, next_at SOBJ T at S, vase_at H SOBJ at S, succ S S2
  ;; add: next_at H T at S2
  ;; del: vase_at H SOBJ at S
  (:action tightfisted
    :parameters (?h - object ?sobj - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sobj)
      (texture ?t)
      (next_at ?sobj ?t ?s)
      (vase_at ?h ?sobj ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next_at ?h ?t ?s2)
      (not (vase_at ?h ?sobj ?s))
    )
  )
)