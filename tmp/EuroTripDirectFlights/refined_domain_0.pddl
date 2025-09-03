(define (domain IntegratedTravelPlanning)
  (:requirements :strips :typing :adl)
  
  (:types city day)

  (:predicates
    (at ?city - city)
    (visited ?city - city)
    (flight-available ?from - city ?to - city)
    (days-remaining ?d - day)
    (increased-day ?from ?to - day)
    (equal-day ?d1 ?d2 - day)
  )
  
  (:action fly
    :parameters (?from ?to - city)
    :precondition (and (at ?from) (flight-available ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )
  
  (:action stay
    :parameters (?city - city ?today ?tomo - day)
    :precondition (and 
      (at ?city) 
      (increased-day ?today ?tomo)
      (days-remaining ?today)
    )
    :effect (and 
      (visited ?city) 
      (not (days-remaining ?today))
      (days-remaining ?tomo)
    )
  )

  (:action plan-days
    :parameters (?city - city ?days - day)
    :precondition (at ?city)
    :effect (days-planned ?city ?days)
  )
)