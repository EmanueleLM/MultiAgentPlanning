(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city)
    (met_friends_bucharest)
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
  )
  
  (:action fly
    :parameters (?from - city ?to - city ?day1 - day ?day2 - day)
    :precondition (and (at ?from ?day1) (direct_flight ?from ?to) (next_day ?day1 ?day2))
    :effect (and (not (at ?from ?day1)) (at ?to ?day2) (visited ?to))
  )

  (:action stay
    :parameters (?c - city ?day1 - day ?day2 - day)
    :precondition (and (at ?c ?day1) (next_day ?day1 ?day2))
    :effect (and (not (at ?c ?day1)) (at ?c ?day2))
  )

  (:action meet_friends_bucharest
    :parameters (?day - day)
    :precondition (and (at bucharest ?day) (next_day day_5 ?day) (not (next_day day_11 ?day)))
    :effect (met_friends_bucharest)
  )
)