(define (domain ObfuscatedDeceptiveLogistics19)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

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
  )

  ;; paltry: preconds: hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ;; effects: add next ?h ?t, del vase ?h ?c
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  ;; sip: preconds: hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t
  ;; effects: add vase ?h ?c, del next ?h ?t
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  ;; clip: preconds: hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t
  ;; effects: add vase ?h ?s, del next ?h ?t
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  ;; wretched: preconds: sneeze ?a, texture ?b, texture ?c, stupendous ?d,
  ;;            next ?a ?b, collect ?b ?d, collect ?c ?d
  ;; effects: add next ?a ?c, del next ?a ?b
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d)
                       (next ?a ?b) (collect ?b ?d) (collect ?c ?d))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  ;; memory: preconds: cats ?c, spring ?s1, spring ?s2, next ?c ?s1
  ;; effects: add next ?c ?s2, del next ?c ?s1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)))
  )

  ;; tightfisted: preconds: hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s
  ;; effects: add next ?h ?t, del vase ?h ?s
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)