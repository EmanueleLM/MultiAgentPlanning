(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (last_day ?d - day)
    (spent ?d - day ?c - city)
    (relative_window ?d - day)
    (visited_relatives)
    (goal_ok)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition
      (and
        (at ?c)
        (current ?d1)
        (next ?d1 ?d2)
        (not (spent ?d1 ?c))
        (not (last_day ?d1))
      )
    :effect
      (and
        (spent ?d1 ?c)
        (not (current ?d1))
        (current ?d2)
      )
  )

  (:action stay_and_visit_relatives
    :parameters (?d1 - day ?d2 - day)
    :precondition
      (and
        (at valencia)
        (current ?d1)
        (next ?d1 ?d2)
        (relative_window ?d1)
        (not (spent ?d1 valencia))
        (not (visited_relatives))
        (not (last_day ?d1))
      )
    :effect
      (and
        (spent ?d1 valencia)
        (visited_relatives)
        (not (current ?d1))
        (current ?d2)
      )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition
      (and
        (at ?from)
        (direct ?from ?to)
        (not (= ?from ?to))
      )
    :effect
      (and
        (not (at ?from))
        (at ?to)
      )
  )

  (:action finish
    :parameters (?c - city ?d - day)
    :precondition
      (and
        (at ?c)
        (current ?d)
        (last_day ?d)
        (not (spent ?d ?c))
      )
    :effect
      (and
        (spent ?d ?c)
        (not (current ?d))
        (goal_ok)
      )
  )

  (:action finish_and_visit_relatives
    :parameters (?d - day)
    :precondition
      (and
        (at valencia)
        (current ?d)
        (last_day ?d)
        (relative_window ?d)
        (not (spent ?d valencia))
        (not (visited_relatives))
      )
    :effect
      (and
        (spent ?d valencia)
        (visited_relatives)
        (not (current ?d))
        (goal_ok)
      )
  )
)