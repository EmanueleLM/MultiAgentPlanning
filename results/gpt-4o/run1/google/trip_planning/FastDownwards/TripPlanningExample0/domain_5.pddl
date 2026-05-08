(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (in_city ?d - day ?c - city)
    (can_fly ?from - city ?to - city)
    (adjacent_days ?d1 - day ?d2 - day)
    (visited ?c - city)
    (friend_city ?c - city)
    (friend_meeting_day ?d - day)
    (possible_meeting_florence)
  )
  
  (:action fly
    :parameters (?from - city ?to - city ?departure_day - day ?arrival_day - day)
    :precondition (and
      (can_fly ?from ?to)
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
    :effect ()
  )
)