(define (domain travel_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at_city ?d - day ?c - city)
    (conference ?d - day ?c - city)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?cur_day - day ?next_day - day)
    :precondition (and 
      (current_day ?cur_day)
      (direct_flight ?from ?to)
      (at_city ?cur_day ?from)
      (next_day ?cur_day ?next_day))
    :effect (and 
      (not (at_city ?cur_day ?from))
      (at_city ?next_day ?to)
      (not (current_day ?cur_day))
      (current_day ?next_day)))

  (:action stay
    :parameters (?c - city ?cur_day - day ?next_day - day)
    :precondition (and 
      (current_day ?cur_day)
      (at_city ?cur_day ?c)
      (next_day ?cur_day ?next_day))
    :effect (and 
      (not (current_day ?cur_day))
      (current_day ?next_day)
      (at_city ?next_day ?c)))
  
  (:action attend_conference
    :parameters (?c - city ?cur_day - day)
    :precondition (and 
      (current_day ?cur_day)
      (at_city ?cur_day ?c)
      (conference ?cur_day ?c))
    :effect (and))
)