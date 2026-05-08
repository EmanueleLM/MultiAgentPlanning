(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (visited_prague ?d - day)
    (visited_vienna ?d - day)
    (visited_porto ?d - day)
    (workshop_attended ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (connected ?from ?to))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2) 
                 (when (and (at ?to ?d2) (= ?to prague)) (visited_prague ?d2))
                 (when (and (at ?to ?d2) (= ?to vienna)) (visited_vienna ?d2))
                 (when (and (at ?to ?d2) (= ?to porto)) (visited_porto ?d2)))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and (at prague ?d) (or (= ?d day_1) (= ?d day_2) (= ?d day_3)))
    :effect (workshop_attended ?d)
  )

  (:action stay
    :parameters (?c - city ?d - day)
    :precondition (at ?c ?d)
    :effect (when (= ?c prague) (visited_prague ?d))
            (when (= ?c vienna) (visited_vienna ?d))
            (when (= ?c porto) (visited_porto ?d))
  )
)