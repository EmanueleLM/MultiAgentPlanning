(define (domain ObfuscatedDeceptiveLogistics19)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
    (succ ?s1 - stage ?s2 - stage)
    (current-stage ?s - stage)
  )

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t) (current-stage ?st) (succ ?st ?stn))
    :effect (and (next ?h ?t) (not (vase ?h ?c)) (not (current-stage ?st)) (current-stage ?stn))
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t) (current-stage ?st) (succ ?st ?stn))
    :effect (and (vase ?h ?c) (not (next ?h ?t)) (not (current-stage ?st)) (current-stage ?stn))
  )

  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t) (current-stage ?st) (succ ?st ?stn))
    :effect (and (vase ?h ?s) (not (next ?h ?t)) (not (current-stage ?st)) (current-stage ?stn))
  )

  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj ?st - stage ?stn - stage)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d) (next ?a ?b) (collect ?b ?d) (collect ?c ?d) (current-stage ?st) (succ ?st ?stn))
    :effect (and (next ?a ?c) (not (next ?a ?b)) (not (current-stage ?st)) (current-stage ?stn))
  )

  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?st - stage ?stn - stage)
    :precondition (and (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1) (current-stage ?st) (succ ?st ?stn))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)) (not (current-stage ?st)) (current-stage ?stn))
  )

  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s) (current-stage ?st) (succ ?st ?stn))
    :effect (and (next ?h ?t) (not (vase ?h ?s)) (not (current-stage ?st)) (current-stage ?stn))
  )
)