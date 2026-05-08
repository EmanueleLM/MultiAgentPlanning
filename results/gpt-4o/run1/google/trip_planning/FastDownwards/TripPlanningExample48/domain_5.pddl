(define (domain european_city_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day visit)
  (:predicates 
    (current_city ?c - city)
    (planned_on_day ?v - visit ?d - day)
    (connected ?from - city ?to - city)
    (friend_meeting_on_day ?d - day)
    (visited ?c - city ?d - day)
    (next_day ?d - day ?next - day)
  )
  
  (:action fly
    :parameters (?from ?to - city ?day - day ?next_day - day)
    :precondition (and
      (current_city ?from)
      (connected ?from ?to)
      (next_day ?day ?next_day)
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
    )
  )

  (:action plan_visit
    :parameters (?visit - visit ?city - city ?start_day ?end_day - day)
    :precondition (and
      (next_day ?start_day ?end_day)
    )
    :effect (and
      (visited ?city ?start_day)
      (visited ?city ?end_day)
    )
  )

  (:action schedule_meeting
    :parameters (?d - day)
    :precondition (and
      (visited split ?d)
      (or (equal ?d day_2) (equal ?d day_3))
    )
    :effect (friend_meeting_on_day ?d)
  )
)