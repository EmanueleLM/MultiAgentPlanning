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
    :parameters (?start_day - day ?end_day - day)
    :precondition (and
      (at reykjavik ?start_day)
      (show_at_reykjavik ?start_day)
      (next ?start_day ?end_day))
    :effect (and 
      (visited reykjavik)
      (not (at reykjavik ?start_day))
      (at reykjavik ?end_day))
  )

  (:action visit_riga
    :parameters (?start_day - day ?end_day - day)
    :precondition (and
      (at riga ?start_day)
      (next ?start_day ?end_day))
    :effect (and 
      (visited riga)
      (not (at riga ?start_day))
      (at riga ?end_day))
  )

  (:action visit_paris
    :parameters (?start_day - day ?end_day - day)
    :precondition (and
      (at paris ?start_day)
      (next ?start_day ?end_day))
    :effect (and 
      (visited paris)
      (not (at paris ?start_day))
      (at paris ?end_day))
  )
)