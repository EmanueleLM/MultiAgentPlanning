(define (domain trip-planning-example3)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (connected ?from - city ?to - city)
    (prev ?p - day ?d - day)
    (day_assigned ?d - day)
    (located ?c - city ?d - day)
    (travel_day ?d - day)
    (visited ?c - city)
    (meeting ?c - city ?d - day)
  )

  (:action assign_day
    :parameters (?c - city ?d - day)
    :precondition (not (day_assigned ?d))
    :effect (and (day_assigned ?d) (located ?c ?d) (visited ?c))
  )

  (:action stay
    :parameters (?c - city ?prev - day ?d - day)
    :precondition (and (prev ?prev ?d) (not (day_assigned ?d)) (located ?c ?prev))
    :effect (and (day_assigned ?d) (located ?c ?d) (visited ?c))
  )

  (:action travel
    :parameters (?from - city ?to - city ?prev - day ?d - day)
    :precondition (and (prev ?prev ?d) (not (day_assigned ?d)) (located ?from ?prev) (connected ?from ?to))
    :effect (and (day_assigned ?d) (located ?to ?d) (travel_day ?d) (visited ?to))
  )

  (:action schedule_meeting_bucharest
    :parameters (?d - day)
    :precondition (and (day_assigned ?d) (located bucharest ?d) (not (travel_day ?d)))
    :effect (meeting bucharest ?d)
  )
)