(define (domain tripplanningexample8)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (remaining_athens ?n - count)
    (remaining_krakow ?n - count)
    (remaining_zurich ?n - count)
    (dec ?from - count ?to - count)
    (in_athens_window ?d - day)
    (athens_window_satisfied)
  )

  (:action stay_athens
    :parameters (?d1 - day ?d2 - day ?r1 - count ?r2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at athens)
      (remaining_athens ?r1)
      (dec ?r1 ?r2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_athens ?r1))
      (remaining_athens ?r2)
      (athens_window_satisfied)
    )
  )

  (:action stay_athens_after_window
    :parameters (?d1 - day ?d2 - day ?r1 - count ?r2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at athens)
      (remaining_athens ?r1)
      (dec ?r1 ?r2)
      (not (in_athens_window ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_athens ?r1))
      (remaining_athens ?r2)
    )
  )

  (:action stay_krakow
    :parameters (?d1 - day ?d2 - day ?r1 - count ?r2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow)
      (remaining_krakow ?r1)
      (dec ?r1 ?r2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_krakow ?r1))
      (remaining_krakow ?r2)
    )
  )

  (:action stay_zurich
    :parameters (?d1 - day ?d2 - day ?r1 - count ?r2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich)
      (remaining_zurich ?r1)
      (dec ?r1 ?r2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_zurich ?r1))
      (remaining_zurich ?r2)
    )
  )

  (:action fly_to_athens
    :parameters (?from - city ?d1 - day ?d2 - day ?r1 - count ?r2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at athens))
      (direct ?from athens)
      (remaining_athens ?r1)
      (dec ?r1 ?r2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at athens)
      (not (remaining_athens ?r1))
      (remaining_athens ?r2)
      (athens_window_satisfied)
    )
  )

  (:action fly_to_athens_after_window
    :parameters (?from - city ?d1 - day ?d2 - day ?r1 - count ?r2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at athens))
      (direct ?from athens)
      (remaining_athens ?r1)
      (dec ?r1 ?r2)
      (not (in_athens_window ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at athens)
      (not (remaining_athens ?r1))
      (remaining_athens ?r2)
    )
  )

  (:action fly_to_krakow
    :parameters (?from - city ?d1 - day ?d2 - day ?r1 - count ?r2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at krakow))
      (direct ?from krakow)
      (remaining_krakow ?r1)
      (dec ?r1 ?r2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at krakow)
      (not (remaining_krakow ?r1))
      (remaining_krakow ?r2)
    )
  )

  (:action fly_to_zurich
    :parameters (?from - city ?d1 - day ?d2 - day ?r1 - count ?r2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at zurich))
      (direct ?from zurich)
      (remaining_zurich ?r1)
      (dec ?r1 ?r2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at zurich)
      (not (remaining_zurich ?r1))
      (remaining_zurich ?r2)
    )
  )
)