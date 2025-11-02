(define (domain travel)
  (:requirements :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d - day ?d2 - day)
    (connected ?from - city ?to - city)
    (attended-wedding)
  )

  ;; Fly along a direct connection from day ?d to next day ?d2
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (connected ?from ?to) (next ?d ?d2))
    :effect (and (at ?to ?d2))
  )

  ;; Stay in the same city to advance from day ?d to next day ?d2
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (at ?c ?d2))
  )

  ;; Attending the wedding is available only when at Venice on days 8..11.
  ;; These are separate actions (no disjunction in domain preconditions).
  (:action attend-wedding-day8
    :precondition (and (at venice day8))
    :effect (attended-wedding)
  )
  (:action attend-wedding-day9
    :precondition (and (at venice day9))
    :effect (attended-wedding)
  )
  (:action attend-wedding-day10
    :precondition (and (at venice day10))
    :effect (attended-wedding)
  )
  (:action attend-wedding-day11
    :precondition (and (at venice day11))
    :effect (attended-wedding)
  )
)