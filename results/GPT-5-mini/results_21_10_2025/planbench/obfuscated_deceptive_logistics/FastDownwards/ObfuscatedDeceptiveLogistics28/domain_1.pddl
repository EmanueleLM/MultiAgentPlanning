(define (domain ObfuscatedDeceptiveLogistics28)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (vase ?x ?y - object)
    (next ?x ?y - object)
    (sneeze ?x - object)
    (stupendous ?x - object)
    (collect ?x ?y - object)
    (spring ?x - object)
  )

  ;; Action schemas for planner_1 (namespaced p1_)
  (:action p1_paltry
    :parameters (?a ?b ?c - object)
    :precondition (and (hand ?a) (cats ?b) (texture ?c) (vase ?a ?b) (next ?b ?c))
    :effect (and (next ?a ?c) (not (vase ?a ?b)))
  )

  (:action p1_sip
    :parameters (?a ?b ?c - object)
    :precondition (and (hand ?a) (cats ?b) (texture ?c) (next ?a ?c) (next ?b ?c))
    :effect (and (vase ?a ?b) (not (next ?a ?c)))
  )

  (:action p1_clip
    :parameters (?a ?b ?c - object)
    :precondition (and (hand ?a) (sneeze ?b) (texture ?c) (next ?b ?c) (next ?a ?c))
    :effect (and (vase ?a ?b) (not (next ?a ?c)))
  )

  (:action p1_wretched
    :parameters (?a ?b ?c ?d - object)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d) (next ?a ?b) (collect ?b ?d) (collect ?c ?d))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  (:action p1_memory
    :parameters (?a ?b ?c - object)
    :precondition (and (cats ?a) (spring ?b) (spring ?c) (next ?a ?b))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  (:action p1_tightfisted
    :parameters (?a ?b ?c - object)
    :precondition (and (hand ?a) (sneeze ?b) (texture ?c) (next ?b ?c) (vase ?a ?b))
    :effect (and (next ?a ?c) (not (vase ?a ?b)))
  )

  ;; Action schemas for planner_2 (namespaced p2_)
  (:action p2_paltry
    :parameters (?a ?b ?c - object)
    :precondition (and (hand ?a) (cats ?b) (texture ?c) (vase ?a ?b) (next ?b ?c))
    :effect (and (next ?a ?c) (not (vase ?a ?b)))
  )

  (:action p2_sip
    :parameters (?a ?b ?c - object)
    :precondition (and (hand ?a) (cats ?b) (texture ?c) (next ?a ?c) (next ?b ?c))
    :effect (and (vase ?a ?b) (not (next ?a ?c)))
  )

  (:action p2_clip
    :parameters (?a ?b ?c - object)
    :precondition (and (hand ?a) (sneeze ?b) (texture ?c) (next ?b ?c) (next ?a ?c))
    :effect (and (vase ?a ?b) (not (next ?a ?c)))
  )

  (:action p2_wretched
    :parameters (?a ?b ?c ?d - object)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d) (next ?a ?b) (collect ?b ?d) (collect ?c ?d))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  (:action p2_memory
    :parameters (?a ?b ?c - object)
    :precondition (and (cats ?a) (spring ?b) (spring ?c) (next ?a ?b))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  (:action p2_tightfisted
    :parameters (?a ?b ?c - object)
    :precondition (and (hand ?a) (sneeze ?b) (texture ?c) (next ?b ?c) (vase ?a ?b))
    :effect (and (next ?a ?c) (not (vase ?a ?b)))
  )
)