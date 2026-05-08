(define (domain european_trip_14_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)

    (must_meet_day ?d - day)
    (friend_met)

    (barcelona_day_done ?d - day)
    (florence_day_done ?d - day)
    (helsinki_day_done ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action spend_day_in_barcelona
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at barcelona)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (barcelona_day_done ?d1))
    )
    :effect (and
      (barcelona_day_done ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action spend_day_in_florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at florence)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (florence_day_done ?d1))
    )
    :effect (and
      (florence_day_done ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action spend_day_in_florence_meet_friend
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at florence)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (must_meet_day ?d1)
      (not (florence_day_done ?d1))
      (not (friend_met))
    )
    :effect (and
      (florence_day_done ?d1)
      (friend_met)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action spend_day_in_helsinki
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at helsinki)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (helsinki_day_done ?d1))
    )
    :effect (and
      (helsinki_day_done ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)