(define (domain european_trip_16_days_compact)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day count)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (athens_window ?d - day)

    (need_athens ?n - count)
    (need_zurich ?n - count)
    (need_krakow ?n - count)
    (succ ?n1 - count ?n2 - count)
  )

  (:action spend_day
    :parameters (?d - day ?dn - day ?c - city ?n - count ?n2 - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at ?c)
        (succ ?n ?n2)
        (or_dummy))
    :effect
      (and)
  )

  ;; Athens days can be spent on any day, including the relatives window.
  (:action spend_athens
    :parameters (?d - day ?dn - day ?n - count ?n2 - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at athens)
        (need_athens ?n)
        (succ ?n ?n2))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (need_athens ?n))
        (need_athens ?n2))
  )

  (:action spend_athens_last
    :parameters (?d - day ?dn - day ?n - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at athens)
        (need_athens ?n)
        (succ ?n done))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (need_athens ?n))
        (need_athens done))
  )

  (:action spend_zurich
    :parameters (?d - day ?dn - day ?n - count ?n2 - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at zurich)
        (need_zurich ?n)
        (succ ?n ?n2)
        (not (athens_window ?d)))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (need_zurich ?n))
        (need_zurich ?n2))
  )

  (:action spend_zurich_last
    :parameters (?d - day ?dn - day ?n - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at zurich)
        (need_zurich ?n)
        (succ ?n done)
        (not (athens_window ?d)))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (need_zurich ?n))
        (need_zurich done))
  )

  (:action spend_krakow
    :parameters (?d - day ?dn - day ?n - count ?n2 - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at krakow)
        (need_krakow ?n)
        (succ ?n ?n2)
        (not (athens_window ?d)))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (need_krakow ?n))
        (need_krakow ?n2))
  )

  (:action spend_krakow_last
    :parameters (?d - day ?dn - day ?n - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at krakow)
        (need_krakow ?n)
        (succ ?n done)
        (not (athens_window ?d)))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (need_krakow ?n))
        (need_krakow done))
  )

  (:action spend_and_fly_athens_to_zurich
    :parameters (?d - day ?dn - day ?n - count ?n2 - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at athens)
        (direct athens zurich)
        (need_athens ?n)
        (succ ?n ?n2))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (at athens))
        (at zurich)
        (not (need_athens ?n))
        (need_athens ?n2))
  )

  (:action spend_and_fly_athens_to_zurich_last
    :parameters (?d - day ?dn - day ?n - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at athens)
        (direct athens zurich)
        (need_athens ?n)
        (succ ?n done))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (at athens))
        (at zurich)
        (not (need_athens ?n))
        (need_athens done))
  )

  (:action spend_and_fly_zurich_to_athens
    :parameters (?d - day ?dn - day ?n - count ?n2 - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at zurich)
        (direct zurich athens)
        (need_zurich ?n)
        (succ ?n ?n2)
        (not (athens_window ?d)))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (at zurich))
        (at athens)
        (not (need_zurich ?n))
        (need_zurich ?n2))
  )

  (:action spend_and_fly_zurich_to_athens_last
    :parameters (?d - day ?dn - day ?n - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at zurich)
        (direct zurich athens)
        (need_zurich ?n)
        (succ ?n done)
        (not (athens_window ?d)))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (at zurich))
        (at athens)
        (not (need_zurich ?n))
        (need_zurich done))
  )

  (:action spend_and_fly_zurich_to_krakow
    :parameters (?d - day ?dn - day ?n - count ?n2 - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at zurich)
        (direct zurich krakow)
        (need_zurich ?n)
        (succ ?n ?n2)
        (not (athens_window ?d)))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (at zurich))
        (at krakow)
        (not (need_zurich ?n))
        (need_zurich ?n2))
  )

  (:action spend_and_fly_zurich_to_krakow_last
    :parameters (?d - day ?dn - day ?n - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at zurich)
        (direct zurich krakow)
        (need_zurich ?n)
        (succ ?n done)
        (not (athens_window ?d)))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (at zurich))
        (at krakow)
        (not (need_zurich ?n))
        (need_zurich done))
  )

  (:action spend_and_fly_krakow_to_zurich
    :parameters (?d - day ?dn - day ?n - count ?n2 - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at krakow)
        (direct krakow zurich)
        (need_krakow ?n)
        (succ ?n ?n2)
        (not (athens_window ?d)))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (at krakow))
        (at zurich)
        (not (need_krakow ?n))
        (need_krakow ?n2))
  )

  (:action spend_and_fly_krakow_to_zurich_last
    :parameters (?d - day ?dn - day ?n - count)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at krakow)
        (direct krakow zurich)
        (need_krakow ?n)
        (succ ?n done)
        (not (athens_window ?d)))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (at krakow))
        (at zurich)
        (not (need_krakow ?n))
        (need_krakow done))
  )
)