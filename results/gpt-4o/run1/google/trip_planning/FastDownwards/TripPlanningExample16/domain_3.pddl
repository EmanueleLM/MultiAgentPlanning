(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (visited ?c - city ?d - day)
    (workshop_attended ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from ?d) (connected ?from ?to))
    :effect (and (not (at ?from ?d)) (at ?to ?d))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and (at prague ?d) (or (= ?d day_1) (= ?d day_2) (= ?d day_3)))
    :effect (workshop_attended ?d)
  )

  (:action stay
    :parameters (?c - city ?d - day)
    :precondition (at ?c ?d)
    :effect (visited ?c ?d)
  )
)