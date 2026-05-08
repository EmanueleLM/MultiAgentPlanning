(define (domain trip_planning_example18)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited ?d - day ?c - city)
    (friends_window ?d - day)
    (met_friends)
    (started)
  )

  (:action start_in_city
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (not (started))
      (not (at amsterdam))
      (not (at vilnius))
      (not (at bucharest))
      (not (visited ?d amsterdam))
      (not (visited ?d vilnius))
      (not (visited ?d bucharest))
    )
    :effect (and
      (started)
      (at ?c)
      (visited ?d ?c)
    )
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited ?d2 amsterdam))
      (not (visited ?d2 vilnius))
      (not (visited ?d2 bucharest))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?d2 ?c)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited ?d2 amsterdam))
      (not (visited ?d2 vilnius))
      (not (visited ?d2 bucharest))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?d2 ?to)
    )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (friends_window ?d)
      (at bucharest)
      (not (met_friends))
    )
    :effect (met_friends)
  )
)