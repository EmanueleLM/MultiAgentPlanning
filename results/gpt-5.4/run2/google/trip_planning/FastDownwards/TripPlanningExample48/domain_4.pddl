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
    (occupied ?d - day)
    (visited_split_day ?d - day)
    (visited_manchester_day ?d - day)
    (visited_geneva_day ?d - day)
    (met_friend)
  )

  (:action assign_first_day
    :parameters (?c - city ?d - day)
    :precondition (not (occupied ?d))
    :effect (and
      (at ?c ?d)
      (occupied ?d)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (occupied ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (occupied ?d2)
    )
  )

  (:action mark_split_day
    :parameters (?d - day)
    :precondition (and
      (at split ?d)
      (not (visited_split_day ?d))
    )
    :effect (visited_split_day ?d)
  )

  (:action mark_manchester_day
    :parameters (?d - day)
    :precondition (and
      (at manchester ?d)
      (not (visited_manchester_day ?d))
    )
    :effect (visited_manchester_day ?d)
  )

  (:action mark_geneva_day
    :parameters (?d - day)
    :precondition (and
      (at geneva ?d)
      (not (visited_geneva_day ?d))
    )
    :effect (visited_geneva_day ?d)
  )

  (:action meet_friend_on_day_2
    :parameters ()
    :precondition (and
      (at split d2)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action meet_friend_on_day_3
    :parameters ()
    :precondition (and
      (at split d3)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)