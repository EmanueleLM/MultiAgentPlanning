(define (domain trip_planning_example_18)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (day_used ?d - day)
    (stay_count ?c - city ?n - count)
    (at_day ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
  )

  (:action stay_day
    :parameters (?city - city ?d - day ?c_pre - count ?c_post - count)
    :precondition (and
      (current_day ?d)
      (not (day_used ?d))
      (at ?city)
      (stay_count ?city ?c_pre)
      (next_count ?c_pre ?c_post)
    )
    :effect (and
      (day_used ?d)
      (stay_count ?city ?c_post)
      (not (stay_count ?city ?c_pre))
      (at_day ?city ?d)
    )
  )

  (:action fly_day
    :parameters (?from - city ?to - city ?d - day ?c_from_pre - count ?c_from_post - count ?c_to_pre - count ?c_to_post - count)
    :precondition (and
      (current_day ?d)
      (not (day_used ?d))
      (at ?from)
      (can_fly ?from ?to)
      (stay_count ?from ?c_from_pre)
      (next_count ?c_from_pre ?c_from_post)
      (stay_count ?to ?c_to_pre)
      (next_count ?c_to_pre ?c_to_post)
    )
    :effect (and
      (day_used ?d)
      (at ?to)
      (not (at ?from))
      (stay_count ?from ?c_from_post)
      (not (stay_count ?from ?c_from_pre))
      (stay_count ?to ?c_to_post)
      (not (stay_count ?to ?c_to_pre))
      (at_day ?from ?d)
      (at_day ?to ?d)
    )
  )

  (:action advance_day
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (day_used ?d)
      (next_day ?d ?d_next)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )
)