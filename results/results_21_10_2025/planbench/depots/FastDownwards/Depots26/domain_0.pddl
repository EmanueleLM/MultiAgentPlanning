(define (domain orchestrated-domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?x - obj ?y - obj)
    (next ?a - obj ?b - obj)
    (collect ?a - obj ?b - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
  )

  ;; Action schemas drawn from both analysts, kept distinct where semantics differed.
  ;; PlayerA-style actions (suffix _a)
  (:action paltry_a
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  (:action sip_a
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  (:action clip_a
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  (:action wretched_a
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st) (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  (:action memory_cat_a
    :parameters (?c - obj ?sp1 - obj ?sp2 - obj)
    :precondition (and (cats ?c) (spring ?sp1) (spring ?sp2) (next ?c ?sp1))
    :effect (and (next ?c ?sp2) (not (next ?c ?sp1)))
  )

  (:action tightfisted_a
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )

  ;; PlayerB-style actions (suffix _b) — these provide the move primitives used in the validated plan
  (:action paltry_b
    :parameters (?h - obj ?from - obj ?to - obj ?c - obj)
    :precondition (and (hand ?h) (next ?h ?from) (cats ?c) (next ?c ?to))
    :effect (and (next ?h ?to) (not (next ?h ?from)))
  )

  (:action sip_b
    :parameters (?h - obj ?from - obj ?inter - obj ?to - obj)
    :precondition (and (hand ?h) (next ?h ?from) (next ?inter ?to) (sneeze ?inter) (texture ?to))
    :effect (and (next ?h ?to) (not (next ?h ?from)))
  )

  ;; clip_b moves a hand to a target that is currently targeted by some other object
  (:action clip_b
    :parameters (?h - obj ?from - obj ?to - obj ?other - obj)
    :precondition (and (hand ?h) (next ?h ?from) (next ?other ?to) (texture ?to))
    :effect (and (next ?h ?to) (not (next ?h ?from)))
  )

  ;; wretched_b variant aligned to playerB interpretation (hand-moving)
  (:action wretched_b
    :parameters (?h - obj ?from - obj ?to - obj ?s - obj)
    :precondition (and (hand ?h) (next ?h ?from) (stupendous ?s) (collect ?to ?s) (texture ?to))
    :effect (and (next ?h ?to) (not (next ?h ?from)))
  )

  ;; memory_hand moves a hand to any object that is both spring and textured (playerB)
  (:action memory_hand
    :parameters (?h - obj ?from - obj ?to - obj)
    :precondition (and (hand ?h) (next ?h ?from) (spring ?to) (texture ?to))
    :effect (and (next ?h ?to) (not (next ?h ?from)))
  )

  ;; tightfisted_b: generic pointer update (playerB)
  (:action tightfisted_b
    :parameters (?obj - obj ?from - obj ?to - obj)
    :precondition (and (next ?obj ?from) (texture ?to))
    :effect (and (next ?obj ?to) (not (next ?obj ?from)))
  )
)