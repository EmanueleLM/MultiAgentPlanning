(define (domain obfuscated_deceptive_logistics_1)
  (:requirements :strips :typing)
  (:types thing)
  (:predicates
    (hand ?o - thing)
    (cats ?o - thing)
    (texture ?o - thing)
    (sneeze ?o - thing)
    (stupendous ?o - thing)
    (spring ?o - thing)
    (next ?o1 - thing ?o2 - thing)
    (vase ?o1 - thing ?o2 - thing)
    (collect ?o1 - thing ?o2 - thing)
  )

  (:action paltry
    :parameters (?h - thing ?c - thing ?t - thing)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  (:action sip
    :parameters (?h - thing ?c - thing ?t - thing)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  (:action clip
    :parameters (?h - thing ?s - thing ?t - thing)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  (:action wretched
    :parameters (?s - thing ?t1 - thing ?t2 - thing ?st - thing)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st) (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  (:action memory
    :parameters (?c - thing ?sp1 - thing ?sp2 - thing)
    :precondition (and (cats ?c) (spring ?sp1) (spring ?sp2) (next ?c ?sp1))
    :effect (and (next ?c ?sp2) (not (next ?c ?sp1)))
  )

  (:action tightfisted
    :parameters (?h - thing ?s - thing ?t - thing)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)