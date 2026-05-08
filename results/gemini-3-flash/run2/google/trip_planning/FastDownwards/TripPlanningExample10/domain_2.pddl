(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    ;; The traveler is currently in a city.
    (at ?c - city)
    ;; The current calendar day.
    (current_day ?d - day)
    ;; The traveler spent time in a specific city during a specific day.
    (spent ?c - city ?d - day)
    ;; Sequential ordering of days.
    (next ?d1 - day ?d2 - day)
    ;; Existence of a direct flight between two cities.
    (conn ?c1 - city ?c2 - city)
  )

  ;; Action to stay in the same city for the next day.
  ;; This action increments the day and marks the city as spent for that new day.
  (:action stay
    :parameters (?from - day ?to - day ?c - city)
    :precondition (and 
      (current_day ?from) 
      (next ?from ?to) 
      (at ?c)
    )
    :effect (and 
      (not (current_day ?from)) 
      (current_day ?to) 
      (spent ?c ?to)
    )
  )

  ;; Action to fly between two cities.
  ;; The travel day (to) counts as being spent in both the departure and arrival cities.
  (:action fly
    :parameters (?from - day ?to - day ?c_from - city ?c_to - city)
    :precondition (and 
      (current_day ?from) 
      (next ?from ?to) 
      (at ?c_from) 
      (conn ?c_from ?c_to)
    )
    :effect (and 
      (not (current_day ?from)) 
      (current_day ?to) 
      (not (at ?c_from)) 
      (at ?c_to) 
      (spent ?c_from ?to) 
      (spent ?c_to ?to)
    )
  )
)