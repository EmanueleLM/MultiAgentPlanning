(define (domain travel-days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next ?d - day ?d2 - day)
    (direct ?c - city ?c2 - city)
    (need ?d - day ?c - city)
    (satisfied ?d - day)
  )

  (:action mark
    :parameters (?d - day ?c - city)
    :precondition (and
                    (current_day ?d)
                    (at ?c)
                    (need ?d ?c)
                    (not (satisfied ?d))
                   )
    :effect (and
              (satisfied ?d)
             )
  )

  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
                    (current_day ?d)
                    (next ?d ?d2)
                    (at ?c)
                    (satisfied ?d)
                   )
    :effect (and
              (not (current_day ?d))
              (current_day ?d2)
             )
  )

  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
                    (current_day ?d)
                    (next ?d ?d2)
                    (at ?from)
                    (direct ?from ?to)
                    (satisfied ?d)
                   )
    :effect (and
              (not (current_day ?d))
              (current_day ?d2)
              (not (at ?from))
              (at ?to)
             )
  )
)