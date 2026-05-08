(define (domain tripplanningexample28)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day stay_count)

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (final_day ?d - day)

    (count_venice ?n - stay_count)
    (count_florence ?n - stay_count)
    (count_zurich ?n - stay_count)
    (next_count ?n1 - stay_count ?n2 - stay_count)

    (goal_reached)
  )

  (:action stay_in_venice
    :parameters (?d - day ?d_next - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (count_venice ?n1)
      (next_count ?n1 ?n2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (count_venice ?n1))
      (count_venice ?n2))
  )

  (:action stay_in_florence
    :parameters (?d - day ?d_next - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at florence)
      (count_florence ?n1)
      (next_count ?n1 ?n2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (count_florence ?n1))
      (count_florence ?n2))
  )

  (:action stay_in_zurich
    :parameters (?d - day ?d_next - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (count_zurich ?n1)
      (next_count ?n1 ?n2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (count_zurich ?n1))
      (count_zurich ?n2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at ?to))
      (direct_flight ?from ?to))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at ?to))
  )

  (:action finish
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (final_day ?d)
      (count_venice c6)
      (count_florence c6)
      (count_zurich c2))
    :effect (goal_reached)
  )
)