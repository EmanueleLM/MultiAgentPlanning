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
    :parameters (?c - city)
    :precondition (current d1)
    :effect (and
      (at ?c d1)
      (not (current d1))
      (current d2)
    )
  )

  (:action stay_day_2
    :parameters (?c - city)
    :precondition (and
      (current d2)
      (at ?c d1)
      (next d1 d2)
    )
    :effect (and
      (at ?c d2)
      (not (current d2))
      (current d3)
      (friend_met_in_split)
      (visited_split_2_days)
      (visited_manchester_2_days)
      (visited_geneva_2_days)
    )
  )

  (:action fly_day_2
    :parameters (?from - city ?to - city)
    :precondition (and
      (current d2)
      (at ?from d1)
      (direct ?from ?to)
      (not (= ?from ?to))
      (next d1 d2)
    )
    :effect (and
      (at ?to d2)
      (not (current d2))
      (current d3)
    )
  )

  (:action stay_day_3
    :parameters (?c - city)
    :precondition (and
      (current d3)
      (at ?c d2)
      (next d2 d3)
    )
    :effect (and
      (at ?c d3)
      (not (current d3))
      (current d4)
      (friend_met_in_split)
      (visited_split_2_days)
      (visited_manchester_2_days)
      (visited_geneva_2_days)
    )
  )

  (:action fly_day_3
    :parameters (?from - city ?to - city)
    :precondition (and
      (current d3)
      (at ?from d2)
      (direct ?from ?to)
      (not (= ?from ?to))
      (next d2 d3)
    )
    :effect (and
      (at ?to d3)
      (not (current d3))
      (current d4)
    )
  )

  (:action stay_day_4
    :parameters (?c - city)
    :precondition (and
      (current d4)
      (at ?c d3)
      (next d3 d4)
    )
    :effect (and
      (at ?c d4)
      (not (current d4))
      (visited_split_2_days)
      (visited_manchester_2_days)
      (visited_geneva_2_days)
    )
  )

  (:action fly_day_4
    :parameters (?from - city ?to - city)
    :precondition (and
      (current d4)
      (at ?from d3)
      (direct ?from ?to)
      (not (= ?from ?to))
      (next d3 d4)
    )
    :effect (and
      (at ?to d4)
      (not (current d4))
    )
  )

  (:action mark_split_days_1_2
    :parameters ()
    :precondition (and
      (at split d1)
      (at split d2)
      (not (visited_split_2_days))
    )
    :effect (visited_split_2_days)
  )

  (:action mark_split_days_1_3
    :parameters ()
    :precondition (and
      (at split d1)
      (at split d3)
      (not (visited_split_2_days))
    )
    :effect (visited_split_2_days)
  )

  (:action mark_split_days_1_4
    :parameters ()
    :precondition (and
      (at split d1)
      (at split d4)
      (not (visited_split_2_days))
    )
    :effect (visited_split_2_days)
  )

  (:action mark_split_days_2_3
    :parameters ()
    :precondition (and
      (at split d2)
      (at split d3)
      (not (visited_split_2_days))
    )
    :effect (and
      (visited_split_2_days)
      (friend_met_in_split)
    )
  )

  (:action mark_split_days_2_4
    :parameters ()
    :precondition (and
      (at split d2)
      (at split d4)
      (not (visited_split_2_days))
    )
    :effect (and
      (visited_split_2_days)
      (friend_met_in_split)
    )
  )

  (:action mark_split_days_3_4
    :parameters ()
    :precondition (and
      (at split d3)
      (at split d4)
      (not (visited_split_2_days))
    )
    :effect (and
      (visited_split_2_days)
      (friend_met_in_split)
    )
  )

  (:action mark_manchester_days_1_2
    :parameters ()
    :precondition (and
      (at manchester d1)
      (at manchester d2)
      (not (visited_manchester_2_days))
    )
    :effect (visited_manchester_2_days)
  )

  (:action mark_manchester_days_1_3
    :parameters ()
    :precondition (and
      (at manchester d1)
      (at manchester d3)
      (not (visited_manchester_2_days))
    )
    :effect (visited_manchester_2_days)
  )

  (:action mark_manchester_days_1_4
    :parameters ()
    :precondition (and
      (at manchester d1)
      (at manchester d4)
      (not (visited_manchester_2_days))
    )
    :effect (visited_manchester_2_days)
  )

  (:action mark_manchester_days_2_3
    :parameters ()
    :precondition (and
      (at manchester d2)
      (at manchester d3)
      (not (visited_manchester_2_days))
    )
    :effect (visited_manchester_2_days)
  )

  (:action mark_manchester_days_2_4
    :parameters ()
    :precondition (and
      (at manchester d2)
      (at manchester d4)
      (not (visited_manchester_2_days))
    )
    :effect (visited_manchester_2_days)
  )

  (:action mark_manchester_days_3_4
    :parameters ()
    :precondition (and
      (at manchester d3)
      (at manchester d4)
      (not (visited_manchester_2_days))
    )
    :effect (visited_manchester_2_days)
  )

  (:action mark_geneva_days_1_2
    :parameters ()
    :precondition (and
      (at geneva d1)
      (at geneva d2)
      (not (visited_geneva_2_days))
    )
    :effect (visited_geneva_2_days)
  )

  (:action mark_geneva_days_1_3
    :parameters ()
    :precondition (and
      (at geneva d1)
      (at geneva d3)
      (not (visited_geneva_2_days))
    )
    :effect (visited_geneva_2_days)
  )

  (:action mark_geneva_days_1_4
    :parameters ()
    :precondition (and
      (at geneva d1)
      (at geneva d4)
      (not (visited_geneva_2_days))
    )
    :effect (visited_geneva_2_days)
  )

  (:action mark_geneva_days_2_3
    :parameters ()
    :precondition (and
      (at geneva d2)
      (at geneva d3)
      (not (visited_geneva_2_days))
    )
    :effect (visited_geneva_2_days)
  )

  (:action mark_geneva_days_2_4
    :parameters ()
    :precondition (and
      (at geneva d2)
      (at geneva d4)
      (not (visited_geneva_2_days))
    )
    :effect (visited_geneva_2_days)
  )

  (:action mark_geneva_days_3_4
    :parameters ()
    :precondition (and
      (at geneva d3)
      (at geneva d4)
      (not (visited_geneva_2_days))
    )
    :effect (visited_geneva_2_days)
  )
)