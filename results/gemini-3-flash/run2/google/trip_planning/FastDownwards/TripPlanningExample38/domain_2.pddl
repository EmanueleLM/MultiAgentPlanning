(define (domain trip_planning_example_38)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next ?d1 ?d2 - day)
    (can_fly ?c1 ?c2 - city)
    (visited ?c - city ?d - day)
  )

  ;; The travel action moves the traveler from one city to another,
  ;; while also advancing the day. The traveler is considered to have
  ;; visited both the departure and arrival cities on the transition day.
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and 
      (at ?from) 
      (current_day ?d1) 
      (next ?d1 ?d2) 
      (can_fly ?from ?to)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (current_day ?d1)) 
      (current_day ?d2) 
      (visited ?from ?d2) 
      (visited ?to ?d2)
    )
  )

  ;; The stay action keeps the traveler in the same city while
  ;; advancing the day, marking the city as visited for the new day.
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and 
      (at ?c) 
      (current_day ?d1) 
      (next ?d1 ?d2)
    )
    :effect (and 
      (not (current_day ?d1)) 
      (current_day ?d2) 
      (visited ?c ?d2)
    )
  )
)