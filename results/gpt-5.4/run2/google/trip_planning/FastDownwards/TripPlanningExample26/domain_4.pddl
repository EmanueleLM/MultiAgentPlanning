(define (domain trip_planning_example26)
  (:requirements :strips :typing)

  (:types city day)

  (:constants porto berlin reykjavik - city)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (stay_day ?c - city ?d - day)
    (friend_window ?d - day)
    (friend_met)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current ?d)
      (next ?d ?d2)
      (stay_day ?c ?d))
    :effect (and
      (not (current ?d))
      (current ?d2))
  )

  (:action meet_friend_and_stay
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at reykjavik)
      (current ?d)
      (next ?d ?d2)
      (stay_day reykjavik ?d)
      (friend_window ?d))
    :effect (and
      (not (current ?d))
      (current ?d2)
      (friend_met))
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to))
    :effect (and
      (not (at ?from))
      (at ?to))
  )
)