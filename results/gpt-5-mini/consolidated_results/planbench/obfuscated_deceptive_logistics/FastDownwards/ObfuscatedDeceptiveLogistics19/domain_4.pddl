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

  ;; paltry: requires hand H, cats C, texture T, vase H C, next C T
  ;; effect: add next H T, delete vase H C
  ;; enforces discrete stage progression via current-stage & succ
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t) (current-stage ?st) (succ ?st ?stn))
    :effect (and (next ?h ?t) (not (vase ?h ?c)) (not (current-stage ?st)) (current-stage ?stn))
  )

  ;; sip: requires hand H, cats C, texture T, next H T, next C T
  ;; effect: add vase H C, delete next H T
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t) (current-stage ?st) (succ ?st ?stn))
    :effect (and (vase ?h ?c) (not (next ?h ?t)) (not (current-stage ?st)) (current-stage ?stn))
  )

  ;; clip: requires hand H, sneeze S, texture T, next S T, next H T
  ;; effect: add vase H S, delete next H T
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t) (current-stage ?st) (succ ?st ?stn))
    :effect (and (vase ?h ?s) (not (next ?h ?t)) (not (current-stage ?st)) (current-stage ?stn))
  )

  ;; wretched: requires sneeze A, texture B, texture C, stupendous D, next A B, collect B D, collect C D
  ;; effect: add next A C, delete next A B
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj ?st - stage ?stn - stage)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d) (next ?a ?b) (collect ?b ?d) (collect ?c ?d) (current-stage ?st) (succ ?st ?stn))
    :effect (and (next ?a ?c) (not (next ?a ?b)) (not (current-stage ?st)) (current-stage ?stn))
  )

  ;; memory: requires cats C, spring S1, spring S2, next C S1
  ;; effect: add next C S2, delete next C S1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?st - stage ?stn - stage)
    :precondition (and (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1) (current-stage ?st) (succ ?st ?stn))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)) (not (current-stage ?st)) (current-stage ?stn))
  )

  ;; tightfisted: requires hand H, sneeze S, texture T, next S T, vase H S
  ;; effect: add next H T, delete vase H S
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s) (current-stage ?st) (succ ?st ?stn))
    :effect (and (next ?h ?t) (not (vase ?h ?s)) (not (current-stage ?st)) (current-stage ?stn))
  )
)