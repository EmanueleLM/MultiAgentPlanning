(define (domain trip_planning_example29)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (visited ?c - city)
    (wedding_window ?d - day)
    (wedding_attended)
    (day_in_dubrovnik ?d - day)
    (day_in_frankfurt ?d - day)
    (day_in_krakow ?d - day)
  )

  (:action start_in
    :parameters (?c - city)
    :precondition
      (and
        (current_day day1)
        (not (at frankfurt day1))
        (not (at krakow day1))
        (not (at dubrovnik day1))
      )
    :effect
      (and
        (at ?c day1)
        (visited ?c)
      )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next ?d1 ?d2)
        (at ?c ?d1)
        (not (at frankfurt ?d2))
        (not (at krakow ?d2))
        (not (at dubrovnik ?d2))
      )
    :effect
      (and
        (not (current_day ?d1))
        (current_day ?d2)
        (at ?c ?d2)
        (visited ?c)
      )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next ?d1 ?d2)
        (at ?from ?d1)
        (direct ?from ?to)
        (not (= ?from ?to))
        (not (at frankfurt ?d2))
        (not (at krakow ?d2))
        (not (at dubrovnik ?d2))
      )
    :effect
      (and
        (not (current_day ?d1))
        (current_day ?d2)
        (at ?to ?d2)
        (visited ?to)
      )
  )

  (:action attend_wedding
    :parameters (?d - day)
    :precondition
      (and
        (current_day ?d)
        (wedding_window ?d)
        (at krakow ?d)
        (not (wedding_attended))
      )
    :effect
      (wedding_attended)
  )

  (:action mark_dubrovnik_day
    :parameters (?d - day)
    :precondition
      (and
        (at dubrovnik ?d)
        (not (day_in_dubrovnik ?d))
      )
    :effect
      (day_in_dubrovnik ?d)
  )

  (:action mark_frankfurt_day
    :parameters (?d - day)
    :precondition
      (and
        (at frankfurt ?d)
        (not (day_in_frankfurt ?d))
      )
    :effect
      (day_in_frankfurt ?d)
  )

  (:action mark_krakow_day
    :parameters (?d - day)
    :precondition
      (and
        (at krakow ?d)
        (not (day_in_krakow ?d))
      )
    :effect
      (day_in_krakow ?d)
  )
)