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

  (:action visit-istanbul
    :parameters (?cur - day ?next - day)
    :precondition (and
                    (at istanbul)
                    (not (visited istanbul))
                    (has-days ?cur)
                    (decrement5 ?cur ?next)
                  )
    :effect (and
              (visited istanbul)
              (not (has-days ?cur))
              (has-days ?next)
            )
  )

  (:action visit-budapest
    :parameters (?cur - day ?next - day)
    :precondition (and
                    (at budapest)
                    (not (visited budapest))
                    (has-days ?cur)
                    (decrement6 ?cur ?next)
                  )
    :effect (and
              (visited budapest)
              (not (has-days ?cur))
              (has-days ?next)
            )
  )

  (:action visit-dubrovnik
    :parameters (?cur - day ?next - day)
    :precondition (and
                    (at dubrovnik)
                    (not (visited dubrovnik))
                    (has-days ?cur)
                    (decrement3 ?cur ?next)
                  )
    :effect (and
              (visited dubrovnik)
              (not (has-days ?cur))
              (has-days ?next)
            )
  )
)