(define (domain meet-mary)
  (:requirements :strips :typing :negative-preconditions :fluents :numeric-fluents :action-costs)
  (:types location person)
  (:predicates
    (at ?l - location)
    (met ?p - person)
    (friend-location ?p - person ?l - location)
  )
  (:functions
    (current-time)
    (total-cost)
    (travel-time ?from ?to - location)
    (avail-start ?p - person)
    (avail-end ?p - person)
    (latest-start ?p - person)
  )

  (:action travel
    :parameters (?from ?to - location)
    :precondition (at ?from)
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (current-time) (travel-time ?from ?to))
      (increase (total-cost) (travel-time ?from ?to))
    )
  )

  (:action wait-until-noon
    :parameters ()
    :precondition (&lt; (current-time) 720)
    :effect (assign (current-time) 720)
  )

  (:action meet-friend-75
    :parameters (?p - person ?l - location)
    :precondition (and
      (friend-location ?p ?l)
      (at ?l)
      (not (met ?p))
      (>= (current-time) (avail-start ?p))
      (<= (current-time) (latest-start ?p))
      (<= (+ (current-time) 75) (avail-end ?p))
    )
    :effect (and
      (met ?p)
      (increase (current-time) 75)
    )
  )
)