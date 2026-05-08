(define (domain trip_planning_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city slot)

  (:predicates
    (at ?s - slot ?c - city)          ; slot assigned to a city
    (assigned ?s - slot)              ; slot already assigned (prevents double assignment)
    (connected ?c1 - city ?c2 - city) ; direct flight connectivity (directed)
    (next ?s1 - slot ?s2 - slot)      ; temporal successor between slots
    (is_first ?s - slot)              ; marks the initial slot (no predecessor)
  )

  ;; assign a city to the first slot
  (:action assign_first
    :parameters (?s - slot ?c - city)
    :precondition (and (is_first ?s) (not (assigned ?s)))
    :effect (and (at ?s ?c) (assigned ?s))
  )

  ;; stay in the same city from one slot to its successor
  (:action stay_to_next
    :parameters (?s - slot ?sn - slot ?c - city)
    :precondition (and (next ?s ?sn) (at ?s ?c) (not (assigned ?sn)))
    :effect (and (at ?sn ?c) (assigned ?sn))
  )

  ;; take a direct flight from the city on slot ?s to another city on successor slot ?sn
  (:action fly_to_next
    :parameters (?s - slot ?sn - slot ?cf - city ?ct - city)
    :precondition (and (next ?s ?sn) (at ?s ?cf) (connected ?cf ?ct) (not (assigned ?sn)))
    :effect (and (at ?sn ?ct) (assigned ?sn))
  )
)