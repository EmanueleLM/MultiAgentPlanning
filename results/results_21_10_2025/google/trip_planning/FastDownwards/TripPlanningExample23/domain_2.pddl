(define (domain TripPlanningExample23)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (workshop-allowed ?d - day)
    (attended-workshop)
    (connected ?c1 - city ?c2 - city)
    (is-riga ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (connected ?from ?to)
    )
    :effect (and
      (at ?to ?d2)
    )
  )

  (:action attend-workshop
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c ?d)
      (is-riga ?c)
      (workshop-allowed ?d)
      (not (attended-workshop))
    )
    :effect (and
      (attended-workshop)
    )
  )
)