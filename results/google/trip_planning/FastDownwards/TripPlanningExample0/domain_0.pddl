(define (domain travel-domain)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)
  )

  ;; Stay in the same city from day d to the next day d2
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (not (at ?c ?d)) (at ?c ?d2))
  )

  ;; Fly between directly connected cities from day d to the next day d2
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (next ?d ?d2) (connected ?from ?to))
    :effect (and (not (at ?from ?d)) (at ?to ?d2))
  )
)