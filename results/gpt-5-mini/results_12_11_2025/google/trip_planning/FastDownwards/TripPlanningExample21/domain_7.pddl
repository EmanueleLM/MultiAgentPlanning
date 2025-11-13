(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (at ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
    (visited ?c - city)
    (unassigned ?d - day)
    (workshop-day ?d - day)
  )

  (:action assign-first-general
    :parameters (?d - day ?c - city)
    :precondition (and
      (first ?d)
      (unassigned ?d)
      (not (workshop-day ?d))
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?c)
      (visited ?c)
    )
  )

  (:action assign-first-workshop
    :parameters (?d - day)
    :precondition (and
      (first ?d)
      (unassigned ?d)
      (workshop-day ?d)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d venice)
      (visited venice)
    )
  )

  (:action stay-general
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?c)
      (unassigned ?d2)
      (not (workshop-day ?d2))
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 ?c)
      (visited ?c)
    )
  )

  (:action stay-venice-workshop
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 venice)
      (unassigned ?d2)
      (workshop-day ?d2)
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 venice)
      (visited venice)
    )
  )

  (:action fly-general
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?from)
      (unassigned ?d2)
      (direct ?from ?to)
      (not (workshop-day ?d1))
      (not (workshop-day ?d2))
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 ?to)
      (visited ?to)
    )
  )

  (:action fly-into-venice-for-workshop
    :parameters (?d1 - day ?d2 - day ?from - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?from)
      (unassigned ?d2)
      (direct ?from venice)
      (workshop-day ?d2)
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 venice)
      (visited venice)
    )
  )
)