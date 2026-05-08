(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:constants
    florence barcelona helsinki - city
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visit_count ?c - city ?n - count)
    (can_fly ?c1 ?c2 - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (friend_met)
    (is_friend_window ?d - day)
    (is_day_1 ?d - day)
    (started)
  )

  ;; Initialize the trip by choosing a starting city on Day 1.
  (:action start_trip
    :parameters (?c - city ?d1 - day ?n0 - count ?n1 - count)
    :precondition (and
      (not (started))
      (is_day_1 ?d1)
      (visit_count ?c ?n0)
      (next_count ?n0 ?n1)
    )
    :effect (and
      (started)
      (at ?c)
      (current_day ?d1)
      (not (visit_count ?c ?n0))
      (visit_count ?c ?n1)
    )
  )

  ;; Spend a day staying in the same city.
  (:action stay
    :parameters (?c - city ?d - day ?next_d - day ?n - count ?next_n - count)
    :precondition (and
      (started)
      (at ?c)
      (current_day ?d)
      (next_day ?d ?next_d)
      (visit_count ?c ?n)
      (next_count ?n ?next_n)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?next_d)
      (not (visit_count ?c ?n))
      (visit_count ?c ?next_n)
    )
  )

  ;; Spend a day traveling between cities. This counts as a visit day for both cities.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?next_d - day ?nf - count ?nf_next - count ?nt - count ?nt_next - count)
    :precondition (and
      (started)
      (at ?from)
      (can_fly ?from ?to)
      (current_day ?d)
      (next_day ?d ?next_d)
      (visit_count ?from ?nf)
      (next_count ?nf ?nf_next)
      (visit_count ?to ?nt)
      (next_count ?nt ?nt_next)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?next_d)
      (not (visit_count ?from ?nf))
      (visit_count ?from ?nf_next)
      (not (visit_count ?to ?nt))
      (visit_count ?to ?nt_next)
    )
  )

  ;; Meet a friend in Florence if the current day is within the designated window.
  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (at florence)
      (current_day ?d)
      (is_friend_window ?d)
    )
    :effect (and
      (friend_met)
    )
  )
)