(define (domain IntegratedTravelPlanning_FD)
  (:requirements :strips :typing :equality)

  (:types city day)

  (:predicates
    (at ?city - city)
    (visited ?city - city)
    (flight-available ?from - city ?to - city)
    (next-day ?cur ?nxt - day)
    (current-day ?d - day)
    (days-planned-on-day ?city - city ?d - day)
    (stayed ?city - city ?d - day)
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
      (not (current-day ?cur))
      (current-day ?nxt)
      (stayed ?city ?cur)
    )
  )

  (:action mark-visited
    :parameters (?city - city)
    :precondition (at ?city)
    :effect (visited ?city)
  )

  (:action plan-days-in-city
    :parameters (?city - city ?d - day)
    :precondition (and (at ?city) (current-day ?d))
    :effect (days-planned-on-day ?city ?d)
  )
)