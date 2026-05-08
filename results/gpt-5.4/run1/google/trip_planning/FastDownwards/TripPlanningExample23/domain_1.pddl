(define (domain european_trip_8_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (at ?d - day ?c - city)
    (current_day ?d - day)
    (processed ?d - day)
    (counted ?d - day)
    (city_count ?c - city ?n - count)
    (next_count ?n1 - count ?n2 - count)
    (workshop_window ?d - day)
    (attended_workshop)
    (trip_complete)
  )

  (:action start_in_london
    :parameters ()
    :precondition (and
      (current_day day1)
      (not (counted day1))
      (city_count london c0)
    )
    :effect (and
      (at day1 london)
      (counted day1)
      (not (city_count london c0))
      (city_count london c1)
    )
  )

  (:action start_in_bucharest
    :parameters ()
    :precondition (and
      (current_day day1)
      (not (counted day1))
      (city_count bucharest c0)
    )
    :effect (and
      (at day1 bucharest)
      (counted day1)
      (not (city_count bucharest c0))
      (city_count bucharest c1)
    )
  )

  (:action start_in_riga
    :parameters ()
    :precondition (and
      (current_day day1)
      (not (counted day1))
      (city_count riga c0)
    )
    :effect (and
      (at day1 riga)
      (counted day1)
      (not (city_count riga c0))
      (city_count riga c1)
    )
  )

  (:action stay_and_advance
    :parameters (?d1 - day ?d2 - day ?c - city ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?d1 ?c)
      (not (processed ?d1))
      (not (counted ?d2))
      (city_count ?c ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (processed ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?d2 ?c)
      (counted ?d2)
      (not (city_count ?c ?n1))
      (city_count ?c ?n2)
    )
  )

  (:action fly_and_advance
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?d1 ?from)
      (direct ?from ?to)
      (not (processed ?d1))
      (not (counted ?d2))
      (city_count ?to ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (processed ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?d2 ?to)
      (counted ?d2)
      (not (city_count ?to ?n1))
      (city_count ?to ?n2)
    )
  )

  (:action attend_workshop_day5
    :parameters ()
    :precondition (and
      (workshop_window day5)
      (at day5 riga)
      (counted day5)
      (not (attended_workshop))
    )
    :effect (attended_workshop)
  )

  (:action attend_workshop_day6
    :parameters ()
    :precondition (and
      (workshop_window day6)
      (at day6 riga)
      (counted day6)
      (not (attended_workshop))
    )
    :effect (attended_workshop)
  )

  (:action attend_workshop_day7
    :parameters ()
    :precondition (and
      (workshop_window day7)
      (at day7 riga)
      (counted day7)
      (not (attended_workshop))
    )
    :effect (attended_workshop)
  )

  (:action attend_workshop_day8
    :parameters ()
    :precondition (and
      (workshop_window day8)
      (at day8 riga)
      (counted day8)
      (not (attended_workshop))
    )
    :effect (attended_workshop)
  )

  (:action finish_trip
    :parameters ()
    :precondition (and
      (current_day day8)
      (counted day8)
      (city_count london c3)
      (city_count bucharest c3)
      (city_count riga c4)
      (attended_workshop)
    )
    :effect (trip_complete)
  )
)