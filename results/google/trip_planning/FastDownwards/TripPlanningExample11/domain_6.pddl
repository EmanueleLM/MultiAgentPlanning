(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:constants vienna vilnius valencia - city)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?c1 - city ?c2 - city)
  )

  (:action stay-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vienna ?d1)
      (next ?d1 ?d2)
      (not (at vienna ?d2))
      (not (at vilnius ?d2))
      (not (at valencia ?d2))
    )
    :effect (and
      (at vienna ?d2)
    )
  )

  (:action stay-vilnius
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vilnius ?d1)
      (next ?d1 ?d2)
      (not (at vilnius ?d2))
      (not (at vienna ?d2))
      (not (at valencia ?d2))
    )
    :effect (and
      (at vilnius ?d2)
    )
  )

  (:action stay-valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at valencia ?d1)
      (next ?d1 ?d2)
      (not (at valencia ?d2))
      (not (at vienna ?d2))
      (not (at vilnius ?d2))
    )
    :effect (and
      (at valencia ?d2)
    )
  )

  (:action travel-vienna-to-valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vienna ?d1)
      (next ?d1 ?d2)
      (flight vienna valencia)
      (not (at vienna ?d2))
      (not (at valencia ?d2))
      (not (at vilnius ?d2))
    )
    :effect (and
      (at valencia ?d2)
    )
  )

  (:action travel-valencia-to-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at valencia ?d1)
      (next ?d1 ?d2)
      (flight valencia vienna)
      (not (at valencia ?d2))
      (not (at vienna ?d2))
      (not (at vilnius ?d2))
    )
    :effect (and
      (at vienna ?d2)
    )
  )

  (:action travel-vienna-to-vilnius
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vienna ?d1)
      (next ?d1 ?d2)
      (flight vienna vilnius)
      (not (at vienna ?d2))
      (not (at vilnius ?d2))
      (not (at valencia ?d2))
    )
    :effect (and
      (at vilnius ?d2)
    )
  )

  (:action travel-vilnius-to-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vilnius ?d1)
      (next ?d1 ?d2)
      (flight vilnius vienna)
      (not (at vilnius ?d2))
      (not (at vienna ?d2))
      (not (at valencia ?d2))
    )
    :effect (and
      (at vienna ?d2)
    )
  )
)