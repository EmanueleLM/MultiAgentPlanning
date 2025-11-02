(define (domain tripplanningexample19)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:constants brussels valencia nice - city)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d - day ?n - day)
    (filled ?d - day)
    (direct ?a - city ?b - city)
    (in_window ?d - day)
    (visited ?c - city)
    (met_friends)
  )

  (:action stay
    :parameters (?c - city ?d - day ?n - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?n)
      (not (filled ?n)))
    :effect (and
      (at ?c ?n)
      (filled ?n)
      (visited ?c))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?n - day)
    :precondition (and
      (at ?from ?d)
      (next ?d ?n)
      (direct ?from ?to)
      (not (filled ?n)))
    :effect (and
      (at ?to ?n)
      (filled ?n)
      (visited ?to))
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (at nice ?d)
      (in_window ?d)
      (not (met_friends)))
    :effect (and
      (met_friends))
  )
)