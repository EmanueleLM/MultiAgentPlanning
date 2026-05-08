(define (domain european_trip)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates 
    (at ?c - city ?d - day)
    (can_fly ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (event_in_zh ?d - day)
    (stay_planned ?c - city ?d1 - day ?d2 - day)
  )
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and 
      (at ?from ?d1) 
      (can_fly ?from ?to) 
      (next_day ?d1 ?d2)
      (not (event_in_zh ?d1))
    )
    :effect (and 
      (not (at ?from ?d1)) 
      (at ?to ?d2)
    )
  )
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and 
      (at ?c ?d1) 
      (next_day ?d1 ?d2)
      (stay_planned ?c ?d1 ?d2)
    )
    :effect (and 
      (not (at ?c ?d1)) 
      (at ?c ?d2)
    )
  )
)