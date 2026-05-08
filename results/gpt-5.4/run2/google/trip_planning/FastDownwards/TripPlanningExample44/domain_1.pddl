(define (domain trip_planning_example44)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (remaining_rome ?n - count)
    (remaining_lyon ?n - count)
    (remaining_zurich ?n - count)

    (decrement ?from - count ?to - count)

    (wedding_window ?d - day)
    (wedding_attended)

    (day_used ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to))
  )

  (:action stay_rome
    :parameters (?d - day ?d_next - day ?from_n - count ?to_n - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at rome)
      (remaining_rome ?from_n)
      (decrement ?from_n ?to_n)
      (not (day_used ?d)))
    :effect (and
      (day_used ?d)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (remaining_rome ?from_n))
      (remaining_rome ?to_n))
  )

  (:action stay_lyon
    :parameters (?d - day ?d_next - day ?from_n - count ?to_n - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at lyon)
      (remaining_lyon ?from_n)
      (decrement ?from_n ?to_n)
      (not (day_used ?d)))
    :effect (and
      (day_used ?d)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (remaining_lyon ?from_n))
      (remaining_lyon ?to_n))
  )

  (:action stay_zurich_window
    :parameters (?d - day ?d_next - day ?from_n - count ?to_n - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (wedding_window ?d)
      (remaining_zurich ?from_n)
      (decrement ?from_n ?to_n)
      (not (day_used ?d)))
    :effect (and
      (day_used ?d)
      (wedding_attended)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (remaining_zurich ?from_n))
      (remaining_zurich ?to_n))
  )

  (:action stay_zurich_nonwindow
    :parameters (?d - day ?d_next - day ?from_n - count ?to_n - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (not (wedding_window ?d))
      (remaining_zurich ?from_n)
      (decrement ?from_n ?to_n)
      (not (day_used ?d)))
    :effect (and
      (day_used ?d)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (remaining_zurich ?from_n))
      (remaining_zurich ?to_n))
  )
)