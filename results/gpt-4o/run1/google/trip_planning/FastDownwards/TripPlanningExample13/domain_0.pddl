(define (domain travel_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  
  (:predicates
    (at ?city - city ?day - day)
    (visited ?city - city)
    (flight_available ?from_city - city ?to_city - city)
    (current_day ?day - day)
  )

  (:action fly
    :parameters (?from_city - city ?to_city - city ?current_day - day ?next_day - day)
    :precondition (and 
                    (flight_available ?from_city ?to_city)
                    (at ?from_city ?current_day)
                    (current_day ?current_day)
                  )
    :effect (and
              (not (at ?from_city ?next_day))
              (at ?to_city ?next_day)
              (visited ?to_city)
            )
  )

  (:action advance_day
    :parameters (?current_day - day ?next_day - day)
    :precondition (current_day ?current_day)
    :effect (and
              (not (current_day ?current_day))
              (current_day ?next_day)
            )
  )

  (:action stay
    :parameters (?city - city ?current_day - day ?next_day - day)
    :precondition (and 
                    (at ?city ?current_day)
                    (current_day ?current_day)
                  )
    :effect (and
              (at ?city ?next_day)
              (visited ?city)
            )
  )
)