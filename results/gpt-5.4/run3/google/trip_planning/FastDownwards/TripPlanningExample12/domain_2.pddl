(define (domain trip_planning_example12)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:constants
    tallinn - city
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (visited_on ?c - city ?d - day)
    (meeting_window_day ?d - day)
    (friend_met)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action spend_day
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (visited_on ?c ?d))
    )
    :effect (and
      (visited_on ?c ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (at tallinn)
      (current_day ?d)
      (meeting_window_day ?d)
      (not (friend_met))
    )
    :effect (friend_met)
  )
)