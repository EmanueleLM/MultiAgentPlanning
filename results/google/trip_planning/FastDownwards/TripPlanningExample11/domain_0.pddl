(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?c1 - city ?c2 - city)
  )

  (:functions
    (vienna-count) ; number of days assigned to Vienna so far
    (vilnius-count) ; number of days assigned to Vilnius so far
    (valencia-count) ; number of days assigned to Valencia so far
  )

  ; City-stay actions (distinct per city agent)
  (:action stay-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vienna ?d1)
      (next ?d1 ?d2)
      (not (at vilnius ?d2))
      (not (at valencia ?d2))
    )
    :effect (and
      (at vienna ?d2)
      (increase (vienna-count) 1)
    )
  )

  (:action stay-vilnius
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vilnius ?d1)
      (next ?d1 ?d2)
      (not (at vienna ?d2))
      (not (at valencia ?d2))
    )
    :effect (and
      (at vilnius ?d2)
      (increase (vilnius-count) 1)
    )
  )

  (:action stay-valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at valencia ?d1)
      (next ?d1 ?d2)
      (not (at vienna ?d2))
      (not (at vilnius ?d2))
    )
    :effect (and
      (at valencia ?d2)
      (increase (valencia-count) 1)
    )
  )

  ; Travel actions (distinct per directed flight leg). Only direct flights allowed.
  (:action travel-vienna-to-valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vienna ?d1)
      (next ?d1 ?d2)
      (flight vienna valencia)
      (not (at valencia ?d2))
      (not (at vilnius ?d2))
    )
    :effect (and
      (at valencia ?d2)
      (increase (valencia-count) 1)
    )
  )

  (:action travel-valencia-to-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at valencia ?d1)
      (next ?d1 ?d2)
      (flight valencia vienna)
      (not (at vienna ?d2))
      (not (at vilnius ?d2))
    )
    :effect (and
      (at vienna ?d2)
      (increase (vienna-count) 1)
    )
  )

  (:action travel-vienna-to-vilnius
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vienna ?d1)
      (next ?d1 ?d2)
      (flight vienna vilnius)
      (not (at vilnius ?d2))
      (not (at valencia ?d2))
    )
    :effect (and
      (at vilnius ?d2)
      (increase (vilnius-count) 1)
    )
  )

  (:action travel-vilnius-to-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vilnius ?d1)
      (next ?d1 ?d2)
      (flight vilnius vienna)
      (not (at vienna ?d2))
      (not (at valencia ?d2))
    )
    :effect (and
      (at vienna ?d2)
      (increase (vienna-count) 1)
    )
  )
)