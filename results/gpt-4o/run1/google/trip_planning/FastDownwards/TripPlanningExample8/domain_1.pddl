(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (visited_athens_between_1_and_7)
    (next ?d - day ?next - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and 
      (at ?from ?d1)
      (direct_flight ?from ?to)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (at ?from ?d2))
      (at ?to ?d2)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
    )
    :effect (at ?c ?d2)
  )

  (:action visit_athens
    :parameters (?d - day)
    :precondition (and
      (at athens ?d)
      (not (visited_athens_between_1_and_7))
      (>= ?d day_1) (<= ?d day_7)
    )
    :effect (visited_athens_between_1_and_7)
  )
)