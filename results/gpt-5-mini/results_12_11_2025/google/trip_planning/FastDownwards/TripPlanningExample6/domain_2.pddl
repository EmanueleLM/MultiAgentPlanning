(define (domain travel-days)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)           ; traveler is in city ?c on day ?d
    (next ?d - day ?d2 - day)         ; temporal successor relation between days
    (connected ?c - city ?c2 - city)  ; direct-flight connectivity (bidirectional edges provided in problem)
    (assigned ?d - day)               ; a city has been assigned to day ?d (prevents multiple assignments)
  )

  ;; Stay in the same city for the next day (no flight).
  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (at ?d ?c)
      (next ?d ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
    )
  )

  ;; Fly from one city to a directly connected city to be there the next day.
  (:action fly
    :parameters (?d - day ?d2 - day ?c - city ?c2 - city)
    :precondition (and
      (at ?d ?c)
      (next ?d ?d2)
      (connected ?c ?c2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c2)
      (assigned ?d2)
    )
  )
)