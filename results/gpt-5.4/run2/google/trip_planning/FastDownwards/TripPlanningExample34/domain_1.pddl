(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count
  )

  (:predicates
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (at ?c - city ?d - day)
    (used_day ?d - day)

    (count_at ?n - count)
    (count_next ?n1 - count ?n2 - count)

    (valencia_window_met)
  )

  (:action start_in_city
    :parameters (?c - city ?n0 - count ?n1 - count)
    :precondition (and
      (not (used_day day1))
      (count_at ?n0)
      (count_next ?n0 ?n1)
    )
    :effect (and
      (used_day day1)
      (at ?c day1)
      (not (count_at ?n0))
      (count_at ?n1)
      (valencia_window_met)
    )
  )

  (:action start_in_valencia
    :parameters (?n0 - count ?n1 - count)
    :precondition (and
      (not (used_day day1))
      (count_at ?n0)
      (count_next ?n0 ?n1)
    )
    :effect (and
      (used_day day1)
      (at valencia day1)
      (not (count_at ?n0))
      (count_at ?n1)
      (valencia_window_met)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day ?n0 - count ?n1 - count)
    :precondition (and
      (used_day ?d1)
      (at ?c ?d1)
      (next ?d1 ?d2)
      (not (used_day ?d2))
      (count_at ?n0)
      (count_next ?n0 ?n1)
    )
    :effect (and
      (used_day ?d2)
      (at ?c ?d2)
      (not (count_at ?n0))
      (count_at ?n1)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?n0 - count ?n1 - count)
    :precondition (and
      (used_day ?d1)
      (at ?from ?d1)
      (next ?d1 ?d2)
      (not (used_day ?d2))
      (direct ?from ?to)
      (count_at ?n0)
      (count_next ?n0 ?n1)
    )
    :effect (and
      (used_day ?d2)
      (at ?to ?d2)
      (not (count_at ?n0))
      (count_at ?n1)
    )
  )
)