(define (domain european_city_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day visit event)
  (:predicates 
    (current_city ?c - city)
    (planned_on_day ?v - visit ?d - day)
    (connected ?from - city ?to - city)
    (friend_meeting_on_day ?d - day)
    (visited ?c - city ?d - day)
    (exists-day-next ?d - day ?next - day)
    (exists-day-range ?start - day ?end - day)
    (exists-day-between ?check - day ?start - day ?end - day)
    (first_day ?d - day)
    (last_day ?d - day)
  )
  
  (:action fly
    :parameters (?from ?to - city ?day - day ?next_day - day)
    :precondition (and
      (current_city ?from)
      (connected ?from ?to)
      (exists-day-next ?day ?next_day)
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
    )
  )

  (:action plan_visit
    :parameters (?visit - visit ?city - city ?start_day ?end_day - day)
    :precondition (and
      (exists-day-range ?start_day ?end_day)
    )
    :effect (and
      (planned_on_day ?visit ?start_day)
      (planned_on_day ?visit ?end_day)
      (visited ?city ?start_day)
      (visited ?city ?end_day)
    )
  )

  (:action schedule_meeting
    :parameters (?day - day)
    :precondition (and
      (visited split ?day)
      (exists-day-between ?day day_2 day_3)
    )
    :effect (friend_meeting_on_day ?day)
  )
)