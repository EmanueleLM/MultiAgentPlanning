(define (domain travel_plan)

  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?city - city ?day - day)
    (visited ?city - city)
    (show_at_reykjavik ?day - day)
    (can_fly ?from_city - city ?to_city - city)
    (next ?d1 - day ?d2 - day)
  )

  (:action fly
    :parameters (?from_city - city ?to_city - city ?current_day - day ?next_day - day)
    :precondition (and 
      (at ?from_city ?current_day)
      (can_fly ?from_city ?to_city)
      (next ?current_day ?next_day))
    :effect (and 
      (not (at ?from_city ?current_day))
      (at ?to_city ?next_day))
  )

  (:action visit_reykjavik
    :parameters (?day - day)
    :precondition (and
      (at reykjavik ?day)
      (show_at_reykjavik ?day))
    :effect (visited reykjavik)
  )

  (:action visit_riga
    :parameters (?day - day)
    :precondition (at riga ?day)
    :effect (visited riga)
  )

  (:action visit_paris
    :parameters (?day - day)
    :precondition (at paris ?day)
    :effect (visited paris)
  )
)