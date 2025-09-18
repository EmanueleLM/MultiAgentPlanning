(define (domain integrated-travel)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (flight ?from - city ?to - city)
    (direct ?from - city ?to - city)
    (has-days ?d - day)
    (decrement5 ?from - day ?to - day)
    (decrement6 ?from - day ?to - day)
    (decrement3 ?from - day ?to - day)
    (requires5 ?c - city)
    (requires6 ?c - city)
    (requires3 ?c - city)
  )

  (:action start-at
    :parameters (?c - city)
    :precondition (and)
    :effect (and
              (at ?c)
              (visited ?c)
            )
  )

  (:action fly_checker-fly
    :parameters (?from - city ?to - city)
    :precondition (and
                    (at ?from)
                    (direct ?from ?to)
                  )
    :effect (and
              (not (at ?from))
              (at ?to)
              (visited ?to)
            )
  )

  (:action fly_traveler
    :parameters (?from - city ?to - city)
    :precondition (and
                    (at ?from)
                    (flight ?from ?to)
                  )
    :effect (and
              (not (at ?from))
              (at ?to)
            )
  )

  (:action visit-5
    :parameters (?c - city ?cur - day ?next - day)
    :precondition (and
                    (at ?c)
                    (not (visited ?c))
                    (has-days ?cur)
                    (requires5 ?c)
                    (decrement5 ?cur ?next)
                  )
    :effect (and
              (visited ?c)
              (not (has-days ?cur))
              (has-days ?next)
            )
  )

  (:action visit-6
    :parameters (?c - city ?cur - day ?next - day)
    :precondition (and
                    (at ?c)
                    (not (visited ?c))
                    (has-days ?cur)
                    (requires6 ?c)
                    (decrement6 ?cur ?next)
                  )
    :effect (and
              (visited ?c)
              (not (has-days ?cur))
              (has-days ?next)
            )
  )

  (:action visit-3
    :parameters (?c - city ?cur - day ?next - day)
    :precondition (and
                    (at ?c)
                    (not (visited ?c))
                    (has-days ?cur)
                    (requires3 ?c)
                    (decrement3 ?cur ?next)
                  )
    :effect (and
              (visited ?c)
              (not (has-days ?cur))
              (has-days ?next)
            )
  )
)