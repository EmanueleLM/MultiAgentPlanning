(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    day
  )
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (flight ?from - city ?to - city)
    (visited_split_day_1)
    (visited_split_day_2)
    (visited_manchester_day_1)
    (visited_manchester_day_2)
    (visited_geneva_day_1)
    (visited_geneva_day_2)
    (met_friend_in_split)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d_current - day ?d_next - day)
    :precondition (and
      (at_city ?from)
      (current_day ?d_current)
      (flight ?from ?to)
      (next_day ?d_current ?d_next)
    )
    :effect (and
      (not (at_city ?from))
      (at_city ?to)
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  ;; Actions for spending days and counting visits for Split
  (:action spend_day_in_split_count_1
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city split)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (not (visited_split_day_1))
    )
    :effect (and
      (visited_split_day_1)
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  (:action spend_day_in_split_count_2
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city split)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (visited_split_day_1)
      (not (visited_split_day_2))
    )
    :effect (and
      (visited_split_day_2)
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  (:action spend_day_in_split_already_counted
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city split)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (visited_split_day_2)
    )
    :effect (and
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  ;; Actions for spending days and counting visits for Manchester
  (:action spend_day_in_manchester_count_1
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city manchester)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (not (visited_manchester_day_1))
    )
    :effect (and
      (visited_manchester_day_1)
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  (:action spend_day_in_manchester_count_2
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city manchester)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (visited_manchester_day_1)
      (not (visited_manchester_day_2))
    )
    :effect (and
      (visited_manchester_day_2)
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  (:action spend_day_in_manchester_already_counted
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city manchester)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (visited_manchester_day_2)
    )
    :effect (and
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  ;; Actions for spending days and counting visits for Geneva
  (:action spend_day_in_geneva_count_1
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city geneva)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (not (visited_geneva_day_1))
    )
    :effect (and
      (visited_geneva_day_1)
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  (:action spend_day_in_geneva_count_2
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city geneva)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (visited_geneva_day_1)
      (not (visited_geneva_day_2))
    )
    :effect (and
      (visited_geneva_day_2)
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  (:action spend_day_in_geneva_already_counted
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city geneva)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (visited_geneva_day_2)
    )
    :effect (and
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  ;; Actions for meeting friend in Split on Day 2
  (:action meet_friend_in_split_on_d2_count_1
    :parameters (?d_next - day)
    :precondition (and
      (at_city split)
      (current_day d2)
      (next_day d2 ?d_next)
      (not (met_friend_in_split))
      (not (visited_split_day_1))
    )
    :effect (and
      (met_friend_in_split)
      (visited_split_day_1)
      (not (current_day d2))
      (current_day ?d_next)
    )
  )

  (:action meet_friend_in_split_on_d2_count_2
    :parameters (?d_next - day)
    :precondition (and
      (at_city split)
      (current_day d2)
      (next_day d2 ?d_next)
      (not (met_friend_in_split))
      (visited_split_day_1)
      (not (visited_split_day_2))
    )
    :effect (and
      (met_friend_in_split)
      (visited_split_day_2)
      (not (current_day d2))
      (current_day ?d_next)
    )
  )

  (:action meet_friend_in_split_on_d2_already_counted
    :parameters (?d_next - day)
    :precondition (and
      (at_city split)
      (current_day d2)
      (next_day d2 ?d_next)
      (not (met_friend_in_split))
      (visited_split_day_2)
    )
    :effect (and
      (met_friend_in_split)
      (not (current_day d2))
      (current_day ?d_next)
    )
  )

  ;; Actions for meeting friend in Split on Day 3
  (:action meet_friend_in_split_on_d3_count_1
    :parameters (?d_next - day)
    :precondition (and
      (at_city split)
      (current_day d3)
      (next_day d3 ?d_next)
      (not (met_friend_in_split))
      (not (visited_split_day_1))
    )
    :effect (and
      (met_friend_in_split)
      (visited_split_day_1)
      (not (current_day d3))
      (current_day ?d_next)
    )
  )

  (:action meet_friend_in_split_on_d3_count_2
    :parameters (?d_next - day)
    :precondition (and
      (at_city split)
      (current_day d3)
      (next_day d3 ?d_next)
      (not (met_friend_in_split))
      (visited_split_day_1)
      (not (visited_split_day_2))
    )
    :effect (and
      (met_friend_in_split)
      (visited_split_day_2)
      (not (current_day d3))
      (current_day ?d_next)
    )
  )

  (:action meet_friend_in_split_on_d3_already_counted
    :parameters (?d_next - day)
    :precondition (and
      (at_city split)
      (current_day d3)
      (next_day d3 ?d_next)
      (not (met_friend_in_split))
      (visited_split_day_2)
    )
    :effect (and
      (met_friend_in_split)
      (not (current_day d3))
      (current_day ?d_next)
    )
  )
)