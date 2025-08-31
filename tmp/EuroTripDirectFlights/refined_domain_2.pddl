(define (domain IntegratedTravelPlanning)
  (:requirements :strips :typing :equality)

  (:types city day)

  (:predicates
    (at ?city - city)
    (visited ?city - city)
    (flight-available ?from - city ?to - city)
    (next-day ?cur ?nxt - day)
    (current-day ?d - day)
    (days-planned-on-day ?city - city ?d - day)
  )

  (:action fly
    :parameters (?from ?to - city)
    :precondition (and (at ?from) (flight-available ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  (:action stay
    :parameters (?city - city ?cur ?nxt - day)
    :precondition (and 
      (at ?city) 
      (next-day ?cur ?nxt)
      (current-day ?cur)
    )
    :effect (and 
      (visited ?city) 
      (not (current-day ?cur))
      (current-day ?nxt)
    )
  )

  (:action plan-days-in-city
    :parameters (?city - city ?d - day)
    :precondition (and (at ?city) (current-day ?d))
    :effect (days-planned-on-day ?city ?d)
  )
)