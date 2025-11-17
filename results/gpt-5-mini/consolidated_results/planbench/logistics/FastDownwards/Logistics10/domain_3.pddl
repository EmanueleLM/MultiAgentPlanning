(define (domain logistics10)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    ;; static/object properties
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (collect ?x - object ?y - object)
    (spring ?o - object)
    (stupendous ?o - object)

    ;; temporal/succession relation between stage objects
    (succ ?s1 - stage ?s2 - stage)

    ;; time-indexed dynamic relations to enforce explicit stage progression
    (next_at ?x - object ?y - object ?s - stage)
    (vase_at ?x - object ?y - object ?s - stage)
  )

  ;; All actions require a current stage ?s and its immediate successor ?s2 (succ ?s ?s2).
  ;; Effects always delete dynamic facts at the current stage and add dynamic facts at the successor stage,
  ;; making temporal progression explicit and preventing oscillation without consuming bookkeeping tokens.

  ;; paltry: requires (hand ?h) (cats ?c) (texture ?t) (vase_at ?h ?c ?s) (next_at ?c ?t ?s)
  ;; effects: add (next_at ?h ?t ?s2), delete (vase_at ?h ?c ?s)
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

  ;; sip: requires (hand ?h) (cats ?c) (texture ?t) (next_at ?h ?t ?s) (next_at ?c ?t ?s)
  ;; effects: add (vase_at ?h ?c ?s2), delete (next_at ?h ?t ?s)
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

  ;; clip: requires (hand ?h) (sneeze ?sobj) (texture ?t) (next_at ?sobj ?t ?s) (next_at ?h ?t ?s)
  ;; effects: add (vase_at ?h ?sobj ?s2), delete (next_at ?h ?t ?s)
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

  ;; wretched: requires (sneeze ?sobj) (texture ?t1) (texture ?t2) (stupendous ?st)
  ;;           (next_at ?sobj ?t1 ?s) (collect ?t1 ?st) (collect ?t2 ?st)
  ;; effects: add (next_at ?sobj ?t2 ?s2), delete (next_at ?sobj ?t1 ?s)
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

  ;; memory: requires (cats ?c) (spring ?s1) (spring ?s2) (next_at ?c ?s1 ?s)
  ;; effects: add (next_at ?c ?s2 ?s2), delete (next_at ?c ?s1 ?s)
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object ?s - stage ?s2st - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next_at ?c ?s1 ?s)
      (succ ?s ?s2st)
    )
    :effect (and
      (next_at ?c ?s2 ?s2st)
      (not (next_at ?c ?s1 ?s))
    )
  )

  ;; tightfisted: requires (hand ?h) (sneeze ?sobj) (texture ?t) (next_at ?sobj ?t ?s) (vase_at ?h ?sobj ?s)
  ;; effects: add (next_at ?h ?t ?s2), delete (vase_at ?h ?sobj ?s)
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