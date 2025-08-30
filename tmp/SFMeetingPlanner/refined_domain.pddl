(define (domain scheduling)
  (:requirements :typing :durative-actions :fluents :negative-preconditions)
  (:types agent person location)
  (:predicates
    (at-agent ?a - agent ?l - location)
    (at-person ?p - person ?l - location)
    (met ?p - person)
  )
  (:functions
    (current-time)
  )
  (:durative-action travel
    :parameters (?a - agent ?from - location ?to - location)
    :duration (= ?duration 15)
    :condition (at start (at-agent ?a ?from))
    :effect (and
      (at start (not (at-agent ?a ?from)))
      (at end   (at-agent ?a ?to))
      (at end   (increase (current-time) 15))
    )
  )
  (:durative-action wait
    :parameters (?a - agent ?l - location)
    :duration (>= ?duration 0)
    :condition (at start (at-agent ?a ?l))
    :effect (at end (increase (current-time) ?duration))
  )
  (:durative-action meet
    :parameters (?a - agent ?p - person ?l - location)
    :duration (= ?duration 75)
    :condition (and
      (at start (at-agent ?a ?l))
      (at start (at-person ?p ?l))
      (at start (>= (current-time) 405))
      (at start (<= (current-time) 585))
    )
    :effect (and
      (at end   (met ?p))
      (at end   (increase (current-time) 75))
    )
  )
)