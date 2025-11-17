(define (domain logistics10)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
      cat hand texture sneeze stupendous
    spring - texture
    stage
  )

  (:predicates
    (collect ?t - texture ?st - stupendous)

    ;; temporal successor relation (static ordering of stages)
    (succ ?s1 - stage ?s2 - stage)

    ;; dynamic relations indexed by stage
    (next_at ?x - object ?y - object ?s - stage)
    (vase_at ?x - object ?y - object ?s - stage)
  )

  ;; paltry:
  ;; pre: ?h - hand, ?c - cat, ?t - texture, vase_at ?h ?c at S, next_at ?c ?t at S, succ S S2
  ;; add: next_at ?h ?t at S2
  ;; del: vase_at ?h ?c at S
  (:action paltry
    :parameters (?h - hand ?c - cat ?t - texture ?s - stage ?s2 - stage)
    :precondition (and
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
  ;; pre: ?h - hand, ?c - cat, ?t - texture, next_at ?h ?t at S, next_at ?c ?t at S, succ S S2
  ;; add: vase_at ?h ?c at S2
  ;; del: next_at ?h ?t at S
  (:action sip
    :parameters (?h - hand ?c - cat ?t - texture ?s - stage ?s2 - stage)
    :precondition (and
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
  ;; pre: ?h - hand, ?sobj - sneeze, ?t - texture, next_at ?sobj ?t at S, next_at ?h ?t at S, succ S S2
  ;; add: vase_at ?h ?sobj at S2
  ;; del: next_at ?h ?t at S
  (:action clip
    :parameters (?h - hand ?sobj - sneeze ?t - texture ?s - stage ?s2 - stage)
    :precondition (and
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
  ;; pre: ?sobj - sneeze, ?t1 - texture, ?t2 - texture, ?st - stupendous,
  ;;      next_at ?sobj ?t1 at S, collect ?t1 ?st, collect ?t2 ?st, succ S S2
  ;; add: next_at ?sobj ?t2 at S2
  ;; del: next_at ?sobj ?t1 at S
  (:action wretched
    :parameters (?sobj - sneeze ?t1 - texture ?t2 - texture ?st - stupendous ?s - stage ?s2 - stage)
    :precondition (and
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
  ;; pre: ?c - cat, ?sp1 - spring, ?sp2 - spring, next_at ?c ?sp1 at S, succ S S2
  ;; add: next_at ?c ?sp2 at S2
  ;; del: next_at ?c ?sp1 at S
  (:action memory
    :parameters (?c - cat ?sp1 - spring ?sp2 - spring ?s - stage ?s2 - stage)
    :precondition (and
      (next_at ?c ?sp1 ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next_at ?c ?sp2 ?s2)
      (not (next_at ?c ?sp1 ?s))
    )
  )

  ;; tightfisted:
  ;; pre: ?h - hand, ?sobj - sneeze, ?t - texture, next_at ?sobj ?t at S, vase_at ?h ?sobj at S, succ S S2
  ;; add: next_at ?h ?t at S2
  ;; del: vase_at ?h ?sobj at S
  (:action tightfisted
    :parameters (?h - hand ?sobj - sneeze ?t - texture ?s - stage ?s2 - stage)
    :precondition (and
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