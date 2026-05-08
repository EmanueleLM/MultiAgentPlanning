(define (domain trip_planning_example_21)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (can_fly ?c1 - city ?c2 - city)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and 
      (at ?from) 
      (current_day ?d) 
      (can_fly ?from ?to)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (visited ?from ?d) 
      (visited ?to ?d)
    )
  )

  (:action advance_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and 
      (current_day ?d1) 
      (next ?d1 ?d2) 
      (at ?c)
    )
    :effect (and 
      (not (current_day ?d1)) 
      (current_day ?d2) 
      (visited ?c ?d2)
    )
  )
)