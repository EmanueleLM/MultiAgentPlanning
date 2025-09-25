(define (domain trip-integration)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (current-day ?d - day)
    (next ?d - day ?d2 - day)
    (at ?c - city)
    (spent ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (meet_window ?d - day)
    (met)
    (is-florence ?c - city)
  )

  (:action traveler-stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (current-day ?d) (next ?d ?d2) (at ?c))
    :effect (and (not (current-day ?d)) (current-day ?d2) (spent ?c ?d))
  )

  (:action flight-planner-fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (connected ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  (:action traveler-meet
    :parameters (?c - city ?d - day)
    :precondition (and (current-day ?d) (meet_window ?d) (at ?c) (is-florence ?c))
    :effect (and (met))
  )
)