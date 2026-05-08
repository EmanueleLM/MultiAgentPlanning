(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    day
  )
  (:constants
    split manchester geneva - city
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
    (is_friend_meeting_day ?d - day)
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
  ;; These actions are mutually exclusive with meet_friend_in_split actions on meeting days
  (:action spend_day_in_split_1
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city split)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (not (visited_split_day_1))
      (not (is_friend_meeting_day ?d_current)) ; Cannot spend a normal day if it's a designated meeting day
    )
    :effect (and
      (visited_split_day_1)
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  (:action spend_day_in_split_2
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city split)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (visited_split_day_1)
      (not (visited_split_day_2))
      (not (is_friend_meeting_day ?d_current)) ; Cannot spend a normal day if it's a designated meeting day
    )
    :effect (and
      (visited_split_day_2)
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  ;; Actions for spending days and counting visits for Manchester
  (:action spend_day_in_manchester_1
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

  (:action spend_day_in_manchester_2
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

  ;; Actions for spending days and counting visits for Geneva
  (:action spend_day_in_geneva_1
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

  (:action spend_day_in_geneva_2
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city geneva)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (visited_geneva_day_1)
      (not (visited_geneva_day_2))
    )
    :effect (and
      (visited_geneva_2)
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  ;; Actions for meeting friend in Split on a designated meeting day (d2 or d3)
  ;; These actions also count as a day spent in Split.
  (:action meet_friend_in_split_first_day_count
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city split)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (is_friend_meeting_day ?d_current) ; Ensure it's day 2 or day 3
      (not (met_friend_in_split))
      (not (visited_split_day_1))
    )
    :effect (and
      (met_friend_in_split)
      (visited_split_day_1)
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )

  (:action meet_friend_in_split_second_day_count
    :parameters (?d_current - day ?d_next - day)
    :precondition (and
      (at_city split)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (is_friend_meeting_day ?d_current) ; Ensure it's day 2 or day 3
      (not (met_friend_in_split))
      (visited_split_day_1)
      (not (visited_split_day_2))
    )
    :effect (and
      (met_friend_in_split)
      (visited_split_day_2)
      (not (current_day ?d_current))
      (current_day ?d_next)
    )
  )
)