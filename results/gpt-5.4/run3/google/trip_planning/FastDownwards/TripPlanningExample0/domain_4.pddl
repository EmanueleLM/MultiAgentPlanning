(define (domain trip_planning_example0)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (at ?c - city)
    (current_day ?d - day)

    (visited ?d - day ?c - city)

    (needs_visit ?c - city)
    (remaining_city_day ?c - city ?d - day)

    (friend_window ?d - day)
    (friend_met)
  )

  (:action stay_day
    :parameters (?d1 - day ?d2 - day ?c - city ?r1 - day ?r2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (remaining_city_day ?c ?r1)
      (next ?r2 ?r1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?d2 ?c)
      (not (remaining_city_day ?c ?r1))
      (remaining_city_day ?c ?r2)
    )
  )

  (:action stay_day_last_need
    :parameters (?d1 - day ?d2 - day ?c - city ?r1 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (remaining_city_day ?c ?r1)
      (not (remaining_city_day ?c day_1))
      (next day_1 ?r1)
      (needs_visit ?c)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?d2 ?c)
      (not (remaining_city_day ?c ?r1))
      (not (needs_visit ?c))
    )
  )

  (:action fly_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?r1 - day ?r2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (remaining_city_day ?to ?r1)
      (next ?r2 ?r1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?d2 ?to)
      (not (remaining_city_day ?to ?r1))
      (remaining_city_day ?to ?r2)
    )
  )

  (:action fly_day_last_need
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?r1 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (remaining_city_day ?to ?r1)
      (not (remaining_city_day ?to day_1))
      (next day_1 ?r1)
      (needs_visit ?to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?d2 ?to)
      (not (remaining_city_day ?to ?r1))
      (not (needs_visit ?to))
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (friend_window ?d)
      (at florence)
      (visited ?d florence)
      (not (friend_met))
    )
    :effect (friend_met)
  )
)