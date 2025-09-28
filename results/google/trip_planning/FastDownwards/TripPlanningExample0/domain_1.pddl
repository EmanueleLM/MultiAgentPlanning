(define (domain travel)
  (:requirements :strips :typing)
  (:types loc day)
  (:predicates
    (at ?l - loc ?d - day)
    (next ?d1 - day ?d2 - day)
    (connected ?from - loc ?to - loc)
  )

  (:action stay
    :parameters (?l - loc ?d1 - day ?d2 - day)
    :precondition (and (at ?l ?d1) (next ?d1 ?d2))
    :effect (at ?l ?d2)
  )

  (:action fly
    :parameters (?from - loc ?to - loc ?d1 - day ?d2 - day)
    :precondition (and (connected ?from ?to) (at ?from ?d1) (next ?d1 ?d2))
    :effect (at ?to ?d2)
  )
)