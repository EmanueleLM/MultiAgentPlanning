(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:constants
    oslo dublin valencia - city
  )

  (:predicates
    (next ?d1 - day ?d2 - day)
    (present ?c - city ?d - day)
    (flight_allowed ?from - city ?to - city)
  )

  (:action stay-oslo
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (present oslo ?d1)
      (not (present oslo ?d2))
      (not (present dublin ?d2))
      (not (present valencia ?d2))
    )
    :effect (present oslo ?d2)
  )

  (:action stay-dublin
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (present dublin ?d1)
      (not (present dublin ?d2))
      (not (present oslo ?d2))
      (not (present valencia ?d2))
    )
    :effect (present dublin ?d2)
  )

  (:action stay-valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (present valencia ?d1)
      (not (present valencia ?d2))
      (not (present oslo ?d2))
      (not (present dublin ?d2))
    )
    :effect (present valencia ?d2)
  )

  (:action fly-oslo-to-dublin
    :parameters (?prev - day ?d - day)
    :precondition (and
      (next ?prev ?d)
      (present oslo ?prev)
      (flight_allowed oslo dublin)
      (not (present oslo ?d))
      (not (present dublin ?d))
      (not (present valencia ?d))
    )
    :effect (present dublin ?d)
  )

  (:action fly-dublin-to-oslo
    :parameters (?prev - day ?d - day)
    :precondition (and
      (next ?prev ?d)
      (present dublin ?prev)
      (flight_allowed dublin oslo)
      (not (present dublin ?d))
      (not (present oslo ?d))
      (not (present valencia ?d))
    )
    :effect (present oslo ?d)
  )

  (:action fly-dublin-to-valencia
    :parameters (?prev - day ?d - day)
    :precondition (and
      (next ?prev ?d)
      (present dublin ?prev)
      (flight_allowed dublin valencia)
      (not (present dublin ?d))
      (not (present valencia ?d))
      (not (present oslo ?d))
    )
    :effect (present valencia ?d)
  )

  (:action fly-valencia-to-dublin
    :parameters (?prev - day ?d - day)
    :precondition (and
      (next ?prev ?d)
      (present valencia ?prev)
      (flight_allowed valencia dublin)
      (not (present valencia ?d))
      (not (present dublin ?d))
      (not (present oslo ?d))
    )
    :effect (present dublin ?d)
  )
)