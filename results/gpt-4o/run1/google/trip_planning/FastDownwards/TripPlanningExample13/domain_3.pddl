(define (domain travel_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  
  (:predicates
    (at ?city - city ?day - day)
    (visited ?city - city)
    (current_day ?day - day)
    (planned_duration ?city - city ?duration - day)
    (flight_available ?from_city - city ?to_city - city)
  )

  (:action fly
    :parameters (?from_city - city ?to_city - city ?depart_day - day ?arrive_day - day)
    :precondition (and 
                    (flight_available ?from_city ?to_city)
                    (current_day ?depart_day)
                    (at ?from_city ?depart_day)
                  )
    :effect (and
              (not (at ?from_city ?arrive_day))
              (at ?to_city ?arrive_day)
              (not (current_day ?depart_day))
              (current_day ?arrive_day)
              (visited ?to_city)
            )
  )

  (:action stay
    :parameters (?city - city ?start_day - day ?duration - day)
    :precondition (and 
                    (at ?city ?start_day)
                    (current_day ?start_day)
                    (planned_duration ?city ?duration)
                  )
    :effect (and
              (not (current_day ?start_day))
              (at ?city ?duration)
              (current_day ?duration)
            )
  )
)