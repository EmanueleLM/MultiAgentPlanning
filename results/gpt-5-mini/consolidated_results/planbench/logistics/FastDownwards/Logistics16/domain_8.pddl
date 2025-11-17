(define (domain corrected_neutral_model)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (sneeze ?x - object)
    (collect ?x - object ?y - object)
    (spring ?x - object)
    (stupendous ?x - object)
    (next ?a - object ?b - object)
    (vase ?a - object ?b - object)
    (succ ?t1 - stage ?t2 - stage)
    (current_stage ?t - stage)
  )

  (:action paltry
    :parameters (?h - object ?c - object ?tx - object ?t - stage ?t_succ - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?tx)
      (vase ?h ?c)
      (next ?c ?tx)
      (succ ?t ?t_succ)
      (current_stage ?t)
    )
    :effect (and
      (next ?h ?tx)
      (not (vase ?h ?c))
      (not (current_stage ?t))
      (current_stage ?t_succ)
    )
  )

  (:action sip
    :parameters (?h - object ?c - object ?tx - object ?t - stage ?t_succ - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?tx)
      (next ?h ?tx)
      (next ?c ?tx)
      (succ ?t ?t_succ)
      (current_stage ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?tx))
      (not (current_stage ?t))
      (current_stage ?t_succ)
    )
  )

  (:action clip
    :parameters (?h - object ?s - object ?tx - object ?t - stage ?t_succ - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?tx)
      (next ?s ?tx)
      (next ?h ?tx)
      (succ ?t ?t_succ)
      (current_stage ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?tx))
      (not (current_stage ?t))
      (current_stage ?t_succ)
    )
  )

  (:action wretched
    :parameters (?s - object ?tx1 - object ?tx2 - object ?collector - object ?t - stage ?t_succ - stage)
    :precondition (and
      (sneeze ?s)
      (texture ?tx1)
      (texture ?tx2)
      (stupendous ?collector)
      (next ?s ?tx1)
      (collect ?tx1 ?collector)
      (collect ?tx2 ?collector)
      (succ ?t ?t_succ)
      (current_stage ?t)
    )
    :effect (and
      (next ?s ?tx2)
      (not (next ?s ?tx1))
      (not (current_stage ?t))
      (current_stage ?t_succ)
    )
  )

  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object ?t - stage ?t_succ - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (succ ?t ?t_succ)
      (current_stage ?t)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
      (not (current_stage ?t))
      (current_stage ?t_succ)
    )
  )

  (:action tightfisted
    :parameters (?h - object ?s - object ?tx - object ?t - stage ?t_succ - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?tx)
      (next ?s ?tx)
      (vase ?h ?s)
      (succ ?t ?t_succ)
      (current_stage ?t)
    )
    :effect (and
      (next ?h ?tx)
      (not (vase ?h ?s))
      (not (current_stage ?t))
      (current_stage ?t_succ)
    )
  )
)