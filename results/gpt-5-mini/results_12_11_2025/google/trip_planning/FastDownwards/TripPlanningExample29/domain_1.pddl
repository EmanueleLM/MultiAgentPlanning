(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)               ; city assigned on a specific day
    (occupied ?d - day)                  ; day has been assigned a city
    (next ?d1 - day ?d2 - day)           ; successor relation between days
    (can-transition ?from - city ?to - city) ; allowed inter-city (or stay) transition
    (city-permitted ?c - city ?d - day)  ; whether a given city is permitted on that day
  )

  ; Generic assignment action: assign the city ?to on successor day ?d2 when currently at ?from on ?d1
  (:action assign-city
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (can-transition ?from ?to)
      (city-permitted ?to ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (occupied ?d2)
    )
  )
)