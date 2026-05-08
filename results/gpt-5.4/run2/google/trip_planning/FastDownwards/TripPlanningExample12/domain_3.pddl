(define (domain trip_planning_example12)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (current_city ?c - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (visit_day ?c - city ?d - day)
    (in_window ?d - day)
    (friend_met)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (current_city amsterdam))
      (not (current_city valencia))
      (not (current_city tallinn))
    )
    :effect (and
      (current_city ?c)
      (visit_day ?c day_1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_city ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visit_day ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_city ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (current_city ?to))
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (visit_day ?to ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (current_city tallinn)
      (current_day ?d)
      (in_window ?d)
      (not (friend_met))
    )
    :effect (friend_met)
  )
)