(define (domain trip_planning_example_34)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (has_visited ?c - city ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (connected ?c1 ?c2 - city)
    (trip_not_started)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (trip_not_started)
    :effect (and 
      (not (trip_not_started)) 
      (at_city ?c)
    )
  )

  (:action visit
    :parameters (?c - city ?d - day ?n - count ?nn - count)
    :precondition (and
      (at_city ?c)
      (current_day ?d)
      (stay_count ?c ?n)
      (next_count ?n ?nn)
      (not (has_visited ?c ?d))
    )
    :effect (and
      (not (stay_count ?c ?n))
      (stay_count ?c ?nn)
      (has_visited ?c ?d)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at_city ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at_city ?from))
      (at_city ?to)
    )
  )

  (:action advance_day
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?nd)
      (not (trip_not_started))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
    )
  )
)