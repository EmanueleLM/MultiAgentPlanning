(define (domain trip-domain)
  (:requirements :strips :typing)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (visited ?c - city ?d - day)
    (wedding_attended)
    (wedding_day ?d - day)
    (is-venice ?c - city)
  )

  (:action stay_traveler
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?a ?c ?d2))
  )

  (:action travel_traveler
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and (at ?a ?to ?d2))
  )

  (:action confirm_visit
    :parameters (?a - agent ?c - city ?d - day)
    :precondition (and (at ?a ?c ?d))
    :effect (and (visited ?c ?d))
  )

  (:action attend_wedding
    :parameters (?a - agent ?c - city ?d - day)
    :precondition (and (at ?a ?c ?d) (is-venice ?c) (wedding_day ?d))
    :effect (and (wedding_attended))
  )
)