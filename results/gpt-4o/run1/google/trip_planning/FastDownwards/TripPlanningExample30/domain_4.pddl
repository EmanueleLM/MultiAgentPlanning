(define (domain european_trip)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates 
    (at ?c - city ?d - day)
    (can_fly ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
  )
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and 
      (at ?from ?d1) 
      (can_fly ?from ?to) 
      (next_day ?d1 ?d2)
    )
    :effect (and 
      (not (at ?from ?d1)) 
      (at ?to ?d2)
    )
  )
  (:action stay
    :parameters (?c - city ?duration_start - day ?duration_end - day)
    :precondition (and 
      (at ?c ?duration_start) 
      (next_day ?duration_start ?duration_end)
    )
    :effect (and 
      (not (at ?c ?duration_start)) 
      (at ?c ?duration_end)
    )
  )
)