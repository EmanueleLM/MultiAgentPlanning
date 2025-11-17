(define (domain trip-planning-example26)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day block)

  (:predicates
    (next-day ?d1 - day ?d2 - day)
    (current-day ?d - day)
    (assigned ?d - day)
    (city-on-day ?c - city ?d - day)
    (belongs-to-block ?d - day ?b - block)
    (block-next ?b1 - block ?b2 - block)
    (block-city ?b - block ?c - city)
    (direct-flight ?from - city ?to - city)
  )

  (:action assign-within-block
    :parameters (?d - day ?b - block ?c - city)
    :precondition (and
      (current-day ?d)
      (belongs-to-block ?d ?b)
      (block-city ?b ?c)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (city-on-day ?c ?d)
    )
  )

  (:action advance-same-block
    :parameters (?d1 - day ?d2 - day ?b - block)
    :precondition (and
      (current-day ?d1)
      (assigned ?d1)
      (next-day ?d1 ?d2)
      (belongs-to-block ?d1 ?b)
      (belongs-to-block ?d2 ?b)
    )
    :effect (and
      (not (current-day ?d1))
      (current-day ?d2)
    )
  )

  (:action fly-to-next-block
    :parameters (?d1 - day ?d2 - day ?b1 - block ?b2 - block ?c1 - city ?c2 - city)
    :precondition (and
      (current-day ?d1)
      (assigned ?d1)
      (next-day ?d1 ?d2)
      (belongs-to-block ?d1 ?b1)
      (belongs-to-block ?d2 ?b2)
      (block-next ?b1 ?b2)
      (block-city ?b1 ?c1)
      (block-city ?b2 ?c2)
      (direct-flight ?c1 ?c2)
      (not (assigned ?d2))
    )
    :effect (and
      (not (current-day ?d1))
      (current-day ?d2)
      (assigned ?d2)
      (city-on-day ?c2 ?d2)
    )
  )
)