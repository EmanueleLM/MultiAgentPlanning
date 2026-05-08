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
    :parameters (?from_city - city ?to_city - city ?depart_day - day ?arrive_day - day)
    :precondition (and 
                    (flight_available ?from_city ?to_city)
                    (at ?from_city ?depart_day)
                    (current_day ?depart_day)
                  )
    :effect (and
              (not (at ?from_city ?arrive_day))
              (at ?to_city ?arrive_day)
              (visited ?to_city)
              (not (current_day ?depart_day))
              (current_day ?arrive_day)
            )
  )

  (:action stay
    :parameters (?city - city ?start_day - day ?end_day - day)
    :precondition (and 
                    (at ?city ?start_day)
                    (current_day ?start_day)
                  )
    :effect (and
              (not (current_day ?start_day))
              (current_day ?end_day)
              (at ?city ?end_day)
              (visited ?city)
            )
  )
)