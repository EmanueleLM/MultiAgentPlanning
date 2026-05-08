(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (in_city ?d - day ?c - city)
    (visited ?c - city)
    (can_fly ?from - city ?to - city)
    (friend_meeting_day ?d - day)
    (adjacent_days ?d1 - day ?d2 - day)
  )
  
  (:action fly
    :parameters (?from - city ?to - city ?departure_day - day ?arrival_day - day)
    :precondition (and
      (visited ?from)
      (can_fly ?from ?to)
      (not (visited ?to))
      (adjacent_days ?departure_day ?arrival_day)
      (in_city ?departure_day ?from)
    )
    :effect (and
      (not (in_city ?departure_day ?from))
      (in_city ?arrival_day ?to)
      (visited ?to)
    )
  )

  (:action spend_day
    :parameters (?day - day ?city - city)
    :precondition (in_city ?day ?city)
    :effect () ; This action simply records being in a city on a specific day
  )
)