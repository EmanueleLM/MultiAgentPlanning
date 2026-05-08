(define (domain trip_planning)

  (:requirements :strips :typing :negative-preconditions)
  
  (:types city day)
  
  (:predicates
    (at ?c - city ?d - day)
    (has_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (visited_for_required_days ?c - city)
  )
  
  (:action travel
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (has_flight ?from ?to)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (at ?from ?d1))
      (at ?to ?d2)
    )
  )
  
  (:action stay
    :parameters (?c - city ?start_day - day ?end_day - day)
    :precondition (and
      (at ?c ?start_day)
      (next ?start_day ?end_day)
      (not (visited_for_required_days ?c))
    )
    :effect (and
      (at ?c ?end_day)
      (visited_for_required_days ?c))
  )
)