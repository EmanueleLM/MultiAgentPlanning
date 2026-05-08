(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types city day)
  
  (:predicates
    (at ?city - city ?day - day)
    (next ?d1 - day ?d2 - day)
    (flight_available ?from_city - city ?to_city - city))

  (:action fly
    :parameters (?from_city - city ?to_city - city ?day - day ?next_day - day)
    :precondition (and (at ?from_city ?day)
                       (flight_available ?from_city ?to_city)
                       (next ?day ?next_day))
    :effect (and (not (at ?from_city ?next_day))
                 (at ?to_city ?next_day)))

  (:action stay
    :parameters (?city - city ?day1 - day ?day2 - day)
    :precondition (and (at ?city ?day1)
                       (next ?day1 ?day2))
    :effect (at ?city ?day2))
)