(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj)
    (next ?a - obj ?b - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
    (spring ?o - obj)
  )

  ;; Actions coming from planner_a (prefix: planner_a_)
  ;; clip: copy a "next" relationship from an object to a hand-holder
  (:action planner_a_clip
    :parameters (?h - obj ?x - obj ?y - obj)
    :precondition (and (hand ?h) (next ?x ?y))
    :effect (and (next ?h ?y))
  )

  ;; wretched: rewire a "next" from a source to a different target,
  ;; requires that the intermediate/current target has texture and some stupendous marker
  (:action planner_a_wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and (next ?a ?b) (texture ?b) (stupendous ?d))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  ;; tightfisted: attach a hand to an object's target (copy next from object to hand)
  (:action planner_a_tightfisted
    :parameters (?h - obj ?x - obj ?z - obj)
    :precondition (and (hand ?h) (next ?x ?z))
    :effect (and (next ?h ?z))
  )

  ;; Actions coming from planner_b (prefix: planner_b_)
  ;; paltry: create a collection link if the object is a cat
  (:action planner_b_paltry
    :parameters (?x - obj ?y - obj)
    :precondition (and (cats ?x))
    :effect (and (collect ?x ?y))
  )

  ;; sip: use a hand and a textured item to create a next relation between the hand and that item
  (:action planner_b_sip
    :parameters (?h - obj ?t - obj)
    :precondition (and (hand ?h) (texture ?t))
    :effect (and (next ?h ?t))
  )

  ;; memory: if an object collected another, mark that object as associated with a vase
  (:action planner_b_memory
    :parameters (?a - obj ?b - obj)
    :precondition (and (collect ?a ?b))
    :effect (and (vase ?a))
  )
)