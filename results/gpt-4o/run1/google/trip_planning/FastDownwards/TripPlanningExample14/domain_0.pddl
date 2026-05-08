(define (domain travel_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  
  (:predicates 
    (at ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (show_in_krakow ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and 
      (connected ?from ?to)
      (at ?from ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and 
      (not (at ?from ?d1))
      (at ?to ?d2)
    )
  )

  (:action attend_show_krakow
    :parameters (?d - day)
    :precondition (and 
      (at krakow ?d)
      (show_in_krakow ?d)
    )
    :effect ()
  )
)