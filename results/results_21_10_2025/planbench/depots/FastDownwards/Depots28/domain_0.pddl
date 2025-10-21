(define (domain orchestrated_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types item)

  (:predicates
    (available ?o - item)
    (held_by_a ?o - item)
    (held_by_b ?o - item)
    (connected ?x - item ?y - item)
    (active ?o - item)
    (processed ?o - item)
  )

  ;; Actions from planner_a
  (:action planner_a_pick
    :parameters (?o - item)
    :precondition (available ?o)
    :effect (and
              (not (available ?o))
              (held_by_a ?o)
            )
  )

  (:action planner_a_put
    :parameters (?o - item)
    :precondition (held_by_a ?o)
    :effect (and
              (not (held_by_a ?o))
              (available ?o)
              (processed ?o)
            )
  )

  (:action planner_a_connect
    :parameters (?x - item ?y - item)
    :precondition (held_by_a ?x)
    :effect (and
              (connected ?x ?y)
              (connected ?y ?x)
            )
  )

  ;; Actions from planner_b
  (:action planner_b_pick
    :parameters (?o - item)
    :precondition (available ?o)
    :effect (and
              (not (available ?o))
              (held_by_b ?o)
            )
  )

  (:action planner_b_release
    :parameters (?o - item)
    :precondition (held_by_b ?o)
    :effect (and
              (not (held_by_b ?o))
              (available ?o)
            )
  )

  (:action planner_b_activate
    :parameters (?o - item)
    :precondition (held_by_b ?o)
    :effect (and
              (active ?o)
            )
  )
)