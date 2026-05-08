(define (domain trip_planning_example40)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler city day
  )

  (:predicates
    (at ?t - traveler ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (located_on ?c - city ?d - day)
    (started ?t - traveler)
  )

  (:action choose_start
    :parameters (?t - traveler ?c - city)
    :precondition (and
      (current_day d1)
      (not (started ?t))
    )
    :effect (and
      (started ?t)
      (at ?t ?c)
      (located_on ?c d1)
    )
  )

  (:action stay
    :parameters (?t - traveler ?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?t ?c)
      (not (located_on oslo ?d2))
      (not (located_on reykjavik ?d2))
      (not (located_on manchester ?d2))
    )
    :effect (and
      (located_on ?c ?d2)
      (current_day ?d2)
      (not (current_day ?d1))
    )
  )

  (:action fly
    :parameters (?t - traveler ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?t ?from)
      (direct ?from ?to)
      (not (located_on oslo ?d2))
      (not (located_on reykjavik ?d2))
      (not (located_on manchester ?d2))
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
      (located_on ?to ?d2)
      (current_day ?d2)
      (not (current_day ?d1))
    )
  )
)