(define (domain trip_planning)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    city day count
  )
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (city_count ?c - city ?n - count)
    (visited_at ?c - city ?d - day)
    (day_next ?d1 - day ?d2 - day)
    (count_next ?n1 - count ?n2 - count)
    (can_fly ?c1 - city ?c2 - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day ?n - count ?nn - count)
    :precondition (and 
      (at_city ?c) 
      (current_day ?d) 
      (day_next ?d ?nd) 
      (city_count ?c ?n) 
      (count_next ?n ?nn)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?nd) 
      (not (city_count ?c ?n)) 
      (city_count ?c ?nn) 
      (visited_at ?c ?d)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and 
      (at_city ?from) 
      (can_fly ?from ?to)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to)
    )
  )
)