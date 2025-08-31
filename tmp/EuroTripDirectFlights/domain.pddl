(define (domain IntegratedTravelPlanning)
  (:requirements :strips :typing)
  
  (:types city day number)
  
  (:predicates
    (at ?city - city)
    (visited ?city - city)
    (flight-available ?from - city ?to - city)
    (days-planned ?city - city ?d - day)
    (travel-day ?d - number)
  )
  
  (:action fly
    :parameters (?from ?to - city)
    :precondition (and (at ?from) (flight-available ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )
  
  (:action stay
    :parameters (?city - city ?d - number)
    :precondition (at ?city)
    :effect (and (visited ?city) (travel-day ?d))
  )

  (:action plan-days
    :parameters (?city - city ?days - day)
    :precondition (at ?city)
    :effect (days-planned ?city ?days)
  )
)