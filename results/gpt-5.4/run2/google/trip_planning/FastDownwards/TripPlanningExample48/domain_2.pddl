(define (domain european_trip_4_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current ?d - day)
    (visited_split_2_days)
    (visited_manchester_2_days)
    (visited_geneva_2_days)
    (friend_met_in_split)
  )

  (:action assign_first_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (at ?c ?d1)
      (not (current ?d1))
      (current ?d2)
    )
  )

  (:action stay_day
    :parameters (?c - city ?d_prev - day ?d_curr - day ?d_next - day)
    :precondition (and
      (current ?d_curr)
      (next ?d_prev ?d_curr)
      (at ?c ?d_prev)
      (next ?d_curr ?d_next)
    )
    :effect (and
      (at ?c ?d_curr)
      (not (current ?d_curr))
      (current ?d_next)
    )
  )

  (:action fly_day
    :parameters (?from - city ?to - city ?d_prev - day ?d_curr - day ?d_next - day)
    :precondition (and
      (current ?d_curr)
      (next ?d_prev ?d_curr)
      (at ?from ?d_prev)
      (direct ?from ?to)
      (not (= ?from ?to))
      (next ?d_curr ?d_next)
    )
    :effect (and
      (at ?to ?d_curr)
      (not (current ?d_curr))
      (current ?d_next)
    )
  )

  (:action stay_last_day
    :parameters (?c - city ?d_prev - day ?d_curr - day)
    :precondition (and
      (current ?d_curr)
      (next ?d_prev ?d_curr)
      (at ?c ?d_prev)
    )
    :effect (and
      (at ?c ?d_curr)
      (not (current ?d_curr))
    )
  )

  (:action fly_last_day
    :parameters (?from - city ?to - city ?d_prev - day ?d_curr - day)
    :precondition (and
      (current ?d_curr)
      (next ?d_prev ?d_curr)
      (at ?from ?d_prev)
      (direct ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (at ?to ?d_curr)
      (not (current ?d_curr))
    )
  )

  (:action mark_split_days_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at split ?d1)
      (at split ?d2)
      (next ?d1 ?d2)
      (not (visited_split_2_days))
    )
    :effect (and
      (visited_split_2_days)
      (friend_met_in_split)
    )
  )

  (:action mark_split_days_2_3
    :parameters (?d2 - day ?d3 - day)
    :precondition (and
      (at split ?d2)
      (at split ?d3)
      (next ?d2 ?d3)
      (not (visited_split_2_days))
    )
    :effect (and
      (visited_split_2_days)
      (friend_met_in_split)
    )
  )

  (:action mark_split_days_3_4
    :parameters (?d3 - day ?d4 - day)
    :precondition (and
      (at split ?d3)
      (at split ?d4)
      (next ?d3 ?d4)
      (not (visited_split_2_days))
    )
    :effect (visited_split_2_days)
  )

  (:action mark_manchester_days_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at manchester ?d1)
      (at manchester ?d2)
      (next ?d1 ?d2)
      (not (visited_manchester_2_days))
    )
    :effect (visited_manchester_2_days)
  )

  (:action mark_manchester_days_2_3
    :parameters (?d2 - day ?d3 - day)
    :precondition (and
      (at manchester ?d2)
      (at manchester ?d3)
      (next ?d2 ?d3)
      (not (visited_manchester_2_days))
    )
    :effect (visited_manchester_2_days)
  )

  (:action mark_manchester_days_3_4
    :parameters (?d3 - day ?d4 - day)
    :precondition (and
      (at manchester ?d3)
      (at manchester ?d4)
      (next ?d3 ?d4)
      (not (visited_manchester_2_days))
    )
    :effect (visited_manchester_2_days)
  )

  (:action mark_geneva_days_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at geneva ?d1)
      (at geneva ?d2)
      (next ?d1 ?d2)
      (not (visited_geneva_2_days))
    )
    :effect (visited_geneva_2_days)
  )

  (:action mark_geneva_days_2_3
    :parameters (?d2 - day ?d3 - day)
    :precondition (and
      (at geneva ?d2)
      (at geneva ?d3)
      (next ?d2 ?d3)
      (not (visited_geneva_2_days))
    )
    :effect (visited_geneva_2_days)
  )

  (:action mark_geneva_days_3_4
    :parameters (?d3 - day ?d4 - day)
    :precondition (and
      (at geneva ?d3)
      (at geneva ?d4)
      (next ?d3 ?d4)
      (not (visited_geneva_2_days))
    )
    :effect (visited_geneva_2_days)
  )
)