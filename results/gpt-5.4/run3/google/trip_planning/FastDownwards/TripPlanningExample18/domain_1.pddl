(define (domain trip_planning_example18)
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
    (visited ?c - city ?d - day)
    (friends_met)
  )

  (:action start_day
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (at amsterdam))
      (not (at vilnius))
      (not (at bucharest))
    )
    :effect (and
      (at ?c)
      (visited ?c day_1)
    )
  )

  (:action stay_and_advance
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (visited ?c ?d2))
    )
    :effect (and
      (visited ?c ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_and_advance
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (visited ?to ?d2))
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action meet_friends_in_bucharest
    :parameters (?d - day)
    :precondition (and
      (at bucharest)
      (visited bucharest ?d)
      (not (friends_met))
    )
    :effect (friends_met)
  )
)