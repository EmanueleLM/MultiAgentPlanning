(define (domain trip-planning)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (direct ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
  )

  ;; Traveler actions (conceptually owned by traveler)
  (:action traveler-stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (at ?c ?d2))
  )

  (:action traveler-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (direct ?from ?to) (next ?d ?d2))
    :effect (and (at ?to ?d2))
  )
)