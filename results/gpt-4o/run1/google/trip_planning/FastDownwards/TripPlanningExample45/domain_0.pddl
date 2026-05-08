(define (domain city_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (current_city ?c - city ?d - day)
    (direct_flight ?c1 ?c2 - city)
    (conference_day ?d - day)
    (successor ?d1 ?d2 - day)
  )
  (:action fly
    :parameters (?from ?to - city ?d-from ?d-to - day)
    :precondition (and
      (current_city ?from ?d-from)
      (direct_flight ?from ?to)
      (successor ?d-from ?d-to)
    )
    :effect (and
      (not (current_city ?from ?d-from))
      (current_city ?to ?d-to)
    )
  )
  (:action stay
    :parameters (?c - city ?d-from ?d-to - day)
    :precondition (and
      (current_city ?c ?d-from)
      (successor ?d-from ?d-to)
    )
    :effect (and
      (not (current_city ?c ?d-from))
      (current_city ?c ?d-to)
    )
  )
)