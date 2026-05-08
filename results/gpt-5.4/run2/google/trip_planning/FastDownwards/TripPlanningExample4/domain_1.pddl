(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited_on ?d - day ?c - city)
    (friend_met)
  )

  (:action stay
    :parameters (?d - day ?d_next - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?c)
    )
    :effect (and
      (visited_on ?d ?c)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly
    :parameters (?d - day ?d_next - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (direct ?from ?to)
    )
    :effect (and
      (visited_on ?d ?from)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (at ?c)
    )
    :effect (and
      (visited_on ?d ?c)
      (not (current_day ?d))
    )
  )

  (:action meet_friend_day_11
    :parameters ()
    :precondition (and
      (visited_on day_11 tallinn)
    )
    :effect (and
      (friend_met)
    )
  )

  (:action meet_friend_day_12
    :parameters ()
    :precondition (and
      (visited_on day_12 tallinn)
    )
    :effect (and
      (friend_met)
    )
  )
)