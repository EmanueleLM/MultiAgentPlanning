(define (domain trip_planning_example48)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    split - city
    day_2 day_3 - day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city ?d - day)
    (friend_met)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (at ?c ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at ?to ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action meet_friend_on_day_2
    :parameters ()
    :precondition (and
      (current_day day_2)
      (at split day_2)
      (not (friend_met))
    )
    :effect (friend_met)
  )

  (:action meet_friend_on_day_3
    :parameters ()
    :precondition (and
      (current_day day_3)
      (at split day_3)
      (not (friend_met))
    )
    :effect (friend_met)
  )
)