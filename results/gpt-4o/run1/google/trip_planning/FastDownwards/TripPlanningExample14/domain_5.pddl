(define (domain travel_plan)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates 
    (at ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and 
      (connected ?from ?to)
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (current_day ?d1)
    )
    :effect (and 
      (not (at ?from ?d1))
      (at ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action remain
    :parameters (?loc - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?loc ?d1)
      (next_day ?d1 ?d2)
      (current_day ?d1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)