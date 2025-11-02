(define (domain meeting-planner-sf)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents)
  (:types
    location person
  )
  (:predicates
    (at ?l - location)
    (person_at ?p - person ?l - location)
  )
  (:functions
    (time)
    (travel_time ?from ?to - location)
    (remaining_need ?p - person)
    (avail_start ?p - person)
    (avail_end ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location)
    :precondition (at ?from)
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (time) (travel_time ?from ?to))
    )
  )

  (:action meet-10
    :parameters (?p - person ?l - location)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (>= (time) (avail_start ?p))
      (<= (time) (- (avail_end ?p) 10))
      (>= (remaining_need ?p) 10)
    )
    :effect (and
      (increase (time) 10)
      (decrease (remaining_need ?p) 10)
    )
  )
)