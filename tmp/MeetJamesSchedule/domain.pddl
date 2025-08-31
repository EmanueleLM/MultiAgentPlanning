(define (domain meeting-scheduling)
  (:requirements :typing :durative-actions :fluents :timed-initial-literals)
  (:types person location)
  (:predicates
    (at ?p - person ?l - location)
    (available ?p - person)
    (met ?p1 - person ?p2 - person)
  )
  (:functions
    (travel-time ?from - location ?to - location)
  )

  ;; Durative action to travel between locations
  (:durative-action travel
    :parameters (?p - person ?from - location ?to - location)
    :duration (= ?duration (travel-time ?from ?to))
    :condition (at start (at ?p ?from))
    :effect (and
      (at end (not (at ?p ?from)))
      (at end (at ?p ?to))
    )
  )

  ;; Durative action to meet: requires both at same place and James is available
  (:durative-action meet
    :parameters (?planner - person ?james - person ?loc - location)
    :duration (>= ?duration 75)
    :condition (and
      (at start (at ?planner ?loc))
      (at start (at ?james ?loc))
      (over all (available ?james))
    )
    :effect (at end (met ?planner ?james))
  )
)