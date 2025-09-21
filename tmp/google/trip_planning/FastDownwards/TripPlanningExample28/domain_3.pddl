(define (domain integrated-euro-itinerary)
  (:requirements :strips :typing :equality)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current-day ?d - day)
    (consumes ?from - day ?to - day)
    (day-at ?d - day ?c - city)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and
              (not (at ?from))
              (at ?to)
            )
  )

  (:action stay
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and (at ?c) (current-day ?d) (consumes ?d ?dnext))
    :effect (and
             (not (current-day ?d))
             (current-day ?dnext)
             (day-at ?d ?c)
            )
  )
)