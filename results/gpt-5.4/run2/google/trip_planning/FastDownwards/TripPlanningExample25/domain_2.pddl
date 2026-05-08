(define (domain european_trip_16_days_min_init)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    valencia lyon split - city
  )

  (:predicates
    (at ?c - city)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (visited ?d - day ?c - city)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited ?d2 ?c))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited ?d2 ?c)
    )
  )

  (:action fly_valencia_lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at valencia)
      (not (visited ?d2 lyon))
    )
    :effect (and
      (not (today ?d1))
      (not (at valencia))
      (at lyon)
      (today ?d2)
      (visited ?d2 lyon)
    )
  )

  (:action fly_lyon_valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at lyon)
      (not (visited ?d2 valencia))
    )
    :effect (and
      (not (today ?d1))
      (not (at lyon))
      (at valencia)
      (today ?d2)
      (visited ?d2 valencia)
    )
  )

  (:action fly_lyon_split
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at lyon)
      (not (visited ?d2 split))
    )
    :effect (and
      (not (today ?d1))
      (not (at lyon))
      (at split)
      (today ?d2)
      (visited ?d2 split)
    )
  )

  (:action fly_split_lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at split)
      (not (visited ?d2 lyon))
    )
    :effect (and
      (not (today ?d1))
      (not (at split))
      (at lyon)
      (today ?d2)
      (visited ?d2 lyon)
    )
  )
)