(define (domain european_trip)

  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?city - city ?day - day)
    (day_friends_available ?day - day)
    (visited ?city - city)
    (next_day ?day - day ?next - day)
    (direct_flight ?from - city ?to - city))

  (:action fly
    :parameters (?from - city ?to - city ?day - day ?next_day - day)
    :precondition (and (at ?from ?day) 
                       (direct_flight ?from ?to) 
                       (next_day ?day ?next_day))
    :effect (and (at ?to ?next_day) 
                 (not (at ?from ?day)) 
                 (visited ?to)))

  (:action stay
    :parameters (?city - city ?day - day ?next_day - day)
    :precondition (and (at ?city ?day) (next_day ?day ?next_day))
    :effect (and (at ?city ?next_day) (not (at ?city ?day))))

  (:action meet_friends_in_venice
    :parameters (?day - day)
    :precondition (and (at venice ?day) (day_friends_available ?day))
    :effect (and (at venice ?day) (visited venice)))
)