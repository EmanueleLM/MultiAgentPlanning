(define (domain trip-14days)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    day city itoken
  )
  (:predicates
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (is-first ?d - day)
    (assigned ?d - day)
    (city-on ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
    (allowed ?d - day ?c - city)
    (needs-token ?c - city)
    (free ?t - itoken)
  )

  (:action assign-first
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d)
      (is-first ?d)
      (next ?d ?d2)
      (allowed ?d ?c)
    )
    :effect (and
      (city-on ?d ?c)
      (assigned ?d)
      (not (current ?d))
      (current ?d2)
    )
  )

  (:action stay-to-next-need-token
    :parameters (?d - day ?d2 - day ?c - city ?t - itoken)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (city-on ?d ?c)
      (allowed ?d2 ?c)
      (needs-token ?c)
      (free ?t)
    )
    :effect (and
      (not (free ?t))
      (city-on ?d2 ?c)
      (assigned ?d2)
      (not (current ?d))
      (current ?d2)
    )
  )

  (:action stay-to-next-no-token
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (city-on ?d ?c)
      (allowed ?d2 ?c)
      (not (needs-token ?c))
    )
    :effect (and
      (city-on ?d2 ?c)
      (assigned ?d2)
      (not (current ?d))
      (current ?d2)
    )
  )

  (:action fly-to-next-need-token
    :parameters (?d - day ?d2 - day ?c1 - city ?c2 - city ?t - itoken)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (city-on ?d ?c1)
      (direct ?c1 ?c2)
      (allowed ?d2 ?c2)
      (needs-token ?c2)
      (free ?t)
    )
    :effect (and
      (not (free ?t))
      (city-on ?d2 ?c2)
      (assigned ?d2)
      (not (current ?d))
      (current ?d2)
    )
  )

  (:action fly-to-next-no-token
    :parameters (?d - day ?d2 - day ?c1 - city ?c2 - city)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (city-on ?d ?c1)
      (direct ?c1 ?c2)
      (allowed ?d2 ?c2)
      (not (needs-token ?c2))
    )
    :effect (and
      (city-on ?d2 ?c2)
      (assigned ?d2)
      (not (current ?d))
      (current ?d2)
    )
  )
)