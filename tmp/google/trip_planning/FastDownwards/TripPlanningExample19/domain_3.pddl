(define (domain orchestrated_trip)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types city day)

  (:predicates
    (in ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (occupied ?d - day)
    (meeting-allowed ?d - day)
    (is-nice ?c - city)
    (met-friends)
  )

  (:functions
    (total-days)
    (days-in ?c - city)
  )

  (:action assign-day-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (in ?c ?d1)
      (next ?d1 ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (in ?c ?d2)
      (occupied ?d2)
      (increase (total-days) 1)
      (increase (days-in ?c) 1)
    )
  )

  (:action assign-day-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (in ?from ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (occupied ?d2))
    )
    :effect (and
      (in ?to ?d2)
      (occupied ?d2)
      (increase (total-days) 1)
      (increase (days-in ?to) 1)
    )
  )

  (:action meet-friends-in-nice
    :parameters (?c - city ?d - day)
    :precondition (and
      (in ?c ?d)
      (is-nice ?c)
      (meeting-allowed ?d)
      (not (met-friends))
    )
    :effect (and
      (met-friends)
    )
  )
)