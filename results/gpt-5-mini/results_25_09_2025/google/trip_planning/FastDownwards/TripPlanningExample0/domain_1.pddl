(define (domain trip-integration)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (day ?d - day)
    (next ?d - day ?d2 - day)
    (at ?c - city)
    (spent ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (meet_window ?d - day)
    (met)
  )

  (:action traveler-stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (day ?d) (next ?d ?d2) (at ?c))
    :effect (and (not (day ?d)) (day ?d2) (spent ?c ?d))
  )

  (:action flight-planner-fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (connected ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  (:action traveler-meet
    :parameters (?d - day)
    :precondition (and (day ?d) (meet_window ?d) (at florence))
    :effect (and (met))
  )
)