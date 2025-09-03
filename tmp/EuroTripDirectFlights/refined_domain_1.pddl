(define (domain IntegratedTravelPlanning)
  (:requirements :strips :typing :equality)
  
  (:types city day)
  
  (:predicates
    (at ?city - city)
    (visited ?city - city)
    (flight-available ?from - city ?to - city)
    (next-day ?cur ?nxt - day)
    (days-remaining ?d - day)
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
      (days-remaining ?cur)
    )
    :effect (and 
      (visited ?city) 
      (not (days-remaining ?cur))
      (days-remaining ?nxt)
    )
  )
    
  (:action plan-days-in-city
    :parameters (?city - city ?d - day)
    :precondition (and (at ?city) (days-remaining ?d))
    :effect (days-planned-on-day ?city ?d)
  )
)