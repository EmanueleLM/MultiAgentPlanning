(define (domain corrected_neutral_model)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    ;; static/type-like predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (sneeze ?x - object)
    (collect ?x - object ?y - object)
    (spring ?x - object)
    (stupendous ?x - object)

    ;; time-indexed fluents
    (next ?a - object ?b - object ?t - stage)
    (vase ?a - object ?b - object ?t - stage)

    ;; stage control
    (succ ?t1 - stage ?t2 - stage)
    (current_stage ?t - stage)
  )

  ;; paltry: requires vase(h,c) and next(c,tx) at current stage,
  ;; produces next(h,tx) at successor stage and removes vase(h,c) at successor stage.
  (:action paltry
    :parameters (?h - object ?c - object ?tx - object ?t - stage ?t_succ - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?tx)
      (vase ?h ?c ?t)
      (next ?c ?tx ?t)
      (succ ?t ?t_succ)
      (current_stage ?t)
    )
    :effect (and
      (next ?h ?tx ?t_succ)
      (not (vase ?h ?c ?t_succ))
      (not (current_stage ?t))
      (current_stage ?t_succ)
    )
  )

  ;; sip: requires next(h,tx) and next(c,tx) at current stage,
  ;; produces vase(h,c) at successor stage and removes next(h,tx) at successor stage.
  (:action sip
    :parameters (?h - object ?c - object ?tx - object ?t - stage ?t_succ - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?tx)
      (next ?h ?tx ?t)
      (next ?c ?tx ?t)
      (succ ?t ?t_succ)
      (current_stage ?t)
    )
    :effect (and
      (vase ?h ?c ?t_succ)
      (not (next ?h ?tx ?t_succ))
      (not (current_stage ?t))
      (current_stage ?t_succ)
    )
  )

  ;; clip: requires next(s,tx) and next(h,tx) at current stage,
  ;; produces vase(h,s) at successor stage and removes next(h,tx) at successor stage.
  (:action clip
    :parameters (?h - object ?s - object ?tx - object ?t - stage ?t_succ - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?tx)
      (next ?s ?tx ?t)
      (next ?h ?tx ?t)
      (succ ?t ?t_succ)
      (current_stage ?t)
    )
    :effect (and
      (vase ?h ?s ?t_succ)
      (not (next ?h ?tx ?t_succ))
      (not (current_stage ?t))
      (current_stage ?t_succ)
    )
  )

  ;; wretched: requires next(s,tx1) at current stage and collector has collect(tx1,collector) and collect(tx2,collector),
  ;; produces next(s,tx2) at successor stage and removes next(s,tx1) at successor stage.
  (:action wretched
    :parameters (?s - object ?tx1 - object ?tx2 - object ?collector - object ?t - stage ?t_succ - stage)
    :precondition (and
      (sneeze ?s)
      (texture ?tx1)
      (texture ?tx2)
      (stupendous ?collector)
      (next ?s ?tx1 ?t)
      (collect ?tx1 ?collector)
      (collect ?tx2 ?collector)
      (succ ?t ?t_succ)
      (current_stage ?t)
    )
    :effect (and
      (next ?s ?tx2 ?t_succ)
      (not (next ?s ?tx1 ?t_succ))
      (not (current_stage ?t))
      (current_stage ?t_succ)
    )
  )

  ;; memory: requires next(c,s1) at current stage and springs s1 and s2,
  ;; produces next(c,s2) at successor stage and removes next(c,s1) at successor stage.
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object ?t - stage ?t_succ - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1 ?t)
      (succ ?t ?t_succ)
      (current_stage ?t)
    )
    :effect (and
      (next ?c ?s2 ?t_succ)
      (not (next ?c ?s1 ?t_succ))
      (not (current_stage ?t))
      (current_stage ?t_succ)
    )
  )

  ;; tightfisted: requires vase(h,s) and next(s,tx) at current stage,
  ;; produces next(h,tx) at successor stage and removes vase(h,s) at successor stage.
  (:action tightfisted
    :parameters (?h - object ?s - object ?tx - object ?t - stage ?t_succ - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?tx)
      (next ?s ?tx ?t)
      (vase ?h ?s ?t)
      (succ ?t ?t_succ)
      (current_stage ?t)
    )
    :effect (and
      (next ?h ?tx ?t_succ)
      (not (vase ?h ?s ?t_succ))
      (not (current_stage ?t))
      (current_stage ?t_succ)
    )
  )

)