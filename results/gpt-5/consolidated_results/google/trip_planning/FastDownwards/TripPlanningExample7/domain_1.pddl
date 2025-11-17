(define (domain trip_planning_example7)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)
  (:predicates
    (at ?c - city)
    (day ?d - day)
    (next ?d1 - day ?d2 - day)
    (edge ?from - city ?to - city)
    (slot-city ?s - slot ?c - city)
    (remaining ?s - slot)
    (done ?s - slot)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day ?s - slot)
    :precondition (and
      (at ?c)
      (day ?d1)
      (next ?d1 ?d2)
      (slot-city ?s ?c)
      (remaining ?s)
    )
    :effect (and
      (not (day ?d1))
      (day ?d2)
      (not (remaining ?s))
      (done ?s)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (edge ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)