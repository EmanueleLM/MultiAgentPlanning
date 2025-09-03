(define (domain IntegratedTravelPlanning_FD)
  (:requirements :strips :typing :equality)

  (:types city day)

  (:predicates
    (at ?city - city)
    (visited ?city - city)
    (flight-available ?from - city ?to - city)
    (next-day ?cur ?nxt - day)
    (current-day ?d - day)
    (stay-day ?city - city ?d - day)
    (traveled-to ?city - city) 
  )

  (:action fly
    :parameters (?from ?to - city)
    :precondition (and (at ?from) (flight-available ?from ?to))
    :effect (and (not (at ?from)) (at ?to) (traveled-to ?to))
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
      (stay-day ?city ?cur)
    )
  )

  (:action mark-visited
    :parameters (?city - city)
    :precondition (at ?city)
    :effect (visited ?city)
  )
)