(define (domain trip-14days)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    day city amtoken
  )
  (:predicates
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (is-first ?d - day)
    (assigned ?d - day)
    (city-on ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
    (allowed ?d - day ?c - city)
    (free ?t - amtoken)
  )

  (:action assign-first-amsterdam
    :parameters (?d - day ?d2 - day ?t - amtoken)
    :precondition (and
      (current ?d)
      (is-first ?d)
      (next ?d ?d2)
      (allowed ?d amsterdam)
      (free ?t)
    )
    :effect (and
      (not (free ?t))
      (city-on ?d amsterdam)
      (assigned ?d)
      (not (is-first ?d))
    )
  )

  (:action stay-in-amsterdam
    :parameters (?d - day ?d2 - day ?t - amtoken)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (city-on ?d amsterdam)
      (allowed ?d2 amsterdam)
      (free ?t)
    )
    :effect (and
      (not (free ?t))
      (city-on ?d2 amsterdam)
      (assigned ?d2)
      (not (current ?d))
      (current ?d2)
    )
  )

  (:action stay-in-istanbul
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (city-on ?d istanbul)
      (allowed ?d2 istanbul)
    )
    :effect (and
      (city-on ?d2 istanbul)
      (assigned ?d2)
      (not (current ?d))
      (current ?d2)
    )
  )

  (:action stay-in-santorini
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (city-on ?d santorini)
      (allowed ?d2 santorini)
    )
    :effect (and
      (city-on ?d2 santorini)
      (assigned ?d2)
      (not (current ?d))
      (current ?d2)
    )
  )

  (:action fly-from-amsterdam
    :parameters (?d - day ?d2 - day ?to - city)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (city-on ?d amsterdam)
      (direct amsterdam ?to)
      (allowed ?d2 ?to)
    )
    :effect (and
      (city-on ?d2 ?to)
      (assigned ?d2)
      (not (current ?d))
      (current ?d2)
    )
  )

  (:action fly-to-amsterdam
    :parameters (?d - day ?d2 - day ?from - city ?t - amtoken)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (city-on ?d ?from)
      (direct ?from amsterdam)
      (allowed ?d2 amsterdam)
      (free ?t)
    )
    :effect (and
      (not (free ?t))
      (city-on ?d2 amsterdam)
      (assigned ?d2)
      (not (current ?d))
      (current ?d2)
    )
  )
)