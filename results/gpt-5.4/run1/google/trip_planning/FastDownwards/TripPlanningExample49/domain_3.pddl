(define (domain trip_planning_example49)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (visited_split_within_window)
    (spent ?d - day ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (spent ?d1 ?c)))
    :effect (and
      (spent ?d1 ?c)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_split_within_window))
  )

  (:action stay_non_split
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (spent ?d1 ?c))
      (not (= ?c split)))
    :effect (and
      (spent ?d1 ?c)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_split_window_d1
    :parameters (?d2 - day)
    :precondition (and
      (at split)
      (current_day d1)
      (next_day d1 ?d2)
      (not (spent d1 split)))
    :effect (and
      (spent d1 split)
      (visited_split_within_window)
      (not (current_day d1))
      (current_day ?d2))
  )

  (:action stay_split_window_d2
    :parameters (?d2 - day)
    :precondition (and
      (at split)
      (current_day d2)
      (next_day d2 ?d2)
      (not (spent d2 split)))
    :effect (and
      (spent d2 split)
      (visited_split_within_window)
      (not (current_day d2))
      (current_day ?d2))
  )

  (:action stay_split_window_d3
    :parameters (?d2 - day)
    :precondition (and
      (at split)
      (current_day d3)
      (next_day d3 ?d2)
      (not (spent d3 split)))
    :effect (and
      (spent d3 split)
      (visited_split_within_window)
      (not (current_day d3))
      (current_day ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (spent ?d1 ?to))
      (not (= ?from ?to)))
    :effect (and
      (not (at ?from))
      (at ?to)
      (spent ?d1 ?to)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action fly_to_split_window_d1
    :parameters (?from - city ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from split)
      (current_day d1)
      (next_day d1 ?d2)
      (not (spent d1 split))
      (not (= ?from split)))
    :effect (and
      (not (at ?from))
      (at split)
      (spent d1 split)
      (visited_split_within_window)
      (not (current_day d1))
      (current_day ?d2))
  )

  (:action fly_to_split_window_d2
    :parameters (?from - city ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from split)
      (current_day d2)
      (next_day d2 ?d2)
      (not (spent d2 split))
      (not (= ?from split)))
    :effect (and
      (not (at ?from))
      (at split)
      (spent d2 split)
      (visited_split_within_window)
      (not (current_day d2))
      (current_day ?d2))
  )

  (:action fly_to_split_window_d3
    :parameters (?from - city ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from split)
      (current_day d3)
      (next_day d3 ?d2)
      (not (spent d3 split))
      (not (= ?from split)))
    :effect (and
      (not (at ?from))
      (at split)
      (spent d3 split)
      (visited_split_within_window)
      (not (current_day d3))
      (current_day ?d2))
  )
)