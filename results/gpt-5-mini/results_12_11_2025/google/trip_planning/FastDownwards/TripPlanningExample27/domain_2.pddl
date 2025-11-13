(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (assigned ?d - day)
  )

  ;; Stay in same city for the next day (consecutive-day occupancy)
  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
                    (next ?d1 ?d2)
                    (at ?d1 ?c)
                    (not (assigned ?d2))
                  )
    :effect (and
              (at ?d2 ?c)
              (assigned ?d2)
            )
  )

  ;; Fly along a direct flight between consecutive days
  (:action fly
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city)
    :precondition (and
                    (next ?d1 ?d2)
                    (at ?d1 ?c1)
                    (direct ?c1 ?c2)
                    (not (assigned ?d2))
                  )
    :effect (and
              (at ?d2 ?c2)
              (assigned ?d2)
            )
  )
)