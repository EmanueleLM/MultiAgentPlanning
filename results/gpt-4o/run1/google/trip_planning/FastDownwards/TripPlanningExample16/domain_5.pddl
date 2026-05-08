(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (visited ?c - city ?d - day)
    (workshop_attended ?d - day)
    (next_day ?d1 - day ?d2 - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (connected ?from ?to) (next_day ?d1 ?d2))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and (at prague ?d) (or (= ?d day_1) (= ?d day_2) (= ?d day_3)))
    :effect (workshop_attended ?d)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2) (visited ?c ?d1))
  )
)