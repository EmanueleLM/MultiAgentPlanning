(define (domain european_trip)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates 
    (at ?c - city ?d - day)
    (can_fly ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
  )
  (:action fly
    :parameters (?from - city ?to - city ?depart - day ?arrive - day)
    :precondition (and 
      (at ?from ?depart) 
      (can_fly ?from ?to)
      (next_day ?depart ?arrive)
    )
    :effect (and 
      (not (at ?from ?depart)) 
      (at ?to ?arrive)
    )
  )
  (:action stay
    :parameters (?c - city ?start - day ?end - day)
    :precondition (and 
      (at ?c ?start) 
      (next_day ?start ?end)
    )
    :effect (and 
      (not (at ?c ?start)) 
      (at ?c ?end)
    )
  )
)