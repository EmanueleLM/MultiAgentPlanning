(define (domain travel-days)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)          ; traveler is in city ?c on day ?d
    (next ?d - day ?d2 - day)       ; day ?d is immediately before day ?d2
    (connected ?c - city ?c2 - city); direct flight adjacency between cities
    (assigned ?d - day)             ; some city has been assigned to day ?d
    (moved ?d - day)                ; a flight was taken on day ?d (to reach day ?d+1)
  )

  ;; Stay in the same city for the next day (no flight required).
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
      (moved ?d)
    )
  )
)