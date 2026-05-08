(define (domain san_francisco_schedule)
  (:requirements :strips :typing)

  (:types
    location friend day_period agent
  )

  (:predicates
    (at ?a - agent ?l - location)
    (visited ?f - friend)
    (free_to_meet ?f - friend ?p - day_period)
    (time_period ?p - day_period)
    (next_period ?p1 ?p2 - day_period)
  )

  (:action travel
    :parameters (?from - location ?to - location ?a - agent ?p1 - day_period ?p2 - day_period)
    :precondition (and
      (at ?a ?from)
      (time_period ?p1)
      (time_period ?p2)
      (next_period ?p1 ?p2)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  (:action meet
    :parameters (?a - agent ?f - friend ?l - location ?p1 - day_period ?p2 - day_period)
    :precondition (and
      (at ?a ?l)
      (free_to_meet ?f ?p2)
      (next_period ?p1 ?p2)
      (not (visited ?f))
    )
    :effect (visited ?f)
  )
)