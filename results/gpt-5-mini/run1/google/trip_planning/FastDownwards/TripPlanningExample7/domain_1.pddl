(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (occupied ?d - day)
    (direct ?from - city ?to - city)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?c - city ?dprev - day ?dnext - day)
    :precondition (and
      (at ?c ?dprev)
      (next ?dprev ?dnext)
      (not (occupied ?dnext))
    )
    :effect (and
      (at ?c ?dnext)
      (occupied ?dnext)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?dprev - day ?dnext - day)
    :precondition (and
      (at ?from ?dprev)
      (next ?dprev ?dnext)
      (direct ?from ?to)
      (not (occupied ?dnext))
    )
    :effect (and
      (at ?to ?dnext)
      (occupied ?dnext)
      (visited ?to)
    )
  )
)