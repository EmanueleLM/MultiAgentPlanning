(define (domain trip_planning)

  (:requirements :strips :typing :negative-preconditions)
  
  (:types city day)

  (:predicates
    (current_city ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (day_before ?d1 - day ?d2 - day)
    (meet_friends ?d - day)
    (planned_stay ?c - city ?d1 - day ?d2 - day)
    (visited ?c - city)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
                    (current_city ?from ?d1)
                    (connected ?from ?to)
                    (day_before ?d1 ?d2)
                    (not (visited ?to)))
    :effect (and
              (not (current_city ?from ?d1))
              (current_city ?to ?d2)
              (visited ?to))
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
                    (current_city ?c ?d1)
                    (day_before ?d1 ?d2)
                    (not (current_city ?c ?d2)))
    :effect (and
              (planned_stay ?c ?d1 ?d2)
              (current_city ?c ?d2))
  )

  (:action meet_friends
    :parameters (?c - city ?d - day)
    :precondition (and
                    (current_city ?c ?d)
                    (meet_friends ?d))
    :effect ()
  )
)