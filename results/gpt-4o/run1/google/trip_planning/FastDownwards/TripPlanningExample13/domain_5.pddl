(define (domain travel_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  
  (:predicates
    (at ?city - city ?day - day)
    (visited ?city - city)
    (current_day ?day - day)
    (next_day ?current - day ?next - day)
    (flight_available ?from_city - city ?to_city - city)
  )

  (:action fly
    :parameters (?from_city - city ?to_city - city ?depart_day - day ?arrive_day - day)
    :precondition (and 
                    (flight_available ?from_city ?to_city)
                    (at ?from_city ?depart_day)
                    (next_day ?depart_day ?arrive_day)
                    (current_day ?depart_day)
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
    :parameters (?city - city ?stay_start_day - day ?stay_end_day - day)
    :precondition (and 
                    (at ?city ?stay_start_day)
                    (current_day ?stay_start_day)
                    (next_day ?stay_start_day ?stay_end_day)
                  )
    :effect (and
              (not (current_day ?stay_start_day))
              (at ?city ?stay_end_day)
              (current_day ?stay_end_day)
            )
  )
)