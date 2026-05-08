(define (domain trip_planning_example8)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day stay_count)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d - day ?dn - day)
    (direct ?from - city ?to - city)

    (athens_allowed_day ?d - day)

    (athens_remaining ?n - stay_count)
    (zurich_remaining ?n - stay_count)
    (krakow_remaining ?n - stay_count)
    (stay_succ ?n - stay_count ?n2 - stay_count)
  )

  (:action stay_athens
    :parameters (?d - day ?dn - day ?n - stay_count ?n2 - stay_count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at athens)
        (athens_allowed_day ?d)
        (athens_remaining ?n)
        (stay_succ ?n ?n2))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (athens_remaining ?n))
        (athens_remaining ?n2))
  )

  (:action stay_zurich
    :parameters (?d - day ?dn - day ?n - stay_count ?n2 - stay_count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at zurich)
        (zurich_remaining ?n)
        (stay_succ ?n ?n2))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (zurich_remaining ?n))
        (zurich_remaining ?n2))
  )

  (:action stay_krakow
    :parameters (?d - day ?dn - day ?n - stay_count ?n2 - stay_count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at krakow)
        (krakow_remaining ?n)
        (stay_succ ?n ?n2))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (krakow_remaining ?n))
        (krakow_remaining ?n2))
  )

  (:action fly_athens_to_zurich
    :parameters (?d - day)
    :precondition
      (and
        (current_day ?d)
        (at athens)
        (direct athens zurich)
        (athens_remaining done))
    :effect
      (and
        (not (at athens))
        (at zurich))
  )

  (:action fly_zurich_to_athens
    :parameters (?d - day)
    :precondition
      (and
        (current_day ?d)
        (at zurich)
        (direct zurich athens)
        (zurich_remaining done)
        (not (athens_remaining done)))
    :effect
      (and
        (not (at zurich))
        (at athens))
  )

  (:action fly_zurich_to_krakow
    :parameters (?d - day)
    :precondition
      (and
        (current_day ?d)
        (at zurich)
        (direct zurich krakow)
        (zurich_remaining done))
    :effect
      (and
        (not (at zurich))
        (at krakow))
  )

  (:action fly_krakow_to_zurich
    :parameters (?d - day)
    :precondition
      (and
        (current_day ?d)
        (at krakow)
        (direct krakow zurich)
        (krakow_remaining done)
        (not (zurich_remaining done)))
    :effect
      (and
        (not (at krakow))
        (at zurich))
  )
)