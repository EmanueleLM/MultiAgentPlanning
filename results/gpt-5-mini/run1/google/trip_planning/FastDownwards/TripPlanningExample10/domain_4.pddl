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

  ;; Stay actions for each city (advance occupancy one day forward)
  (:action stay-oslo
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (present oslo ?d1)
      ;; ensure the target day has no occupancy yet
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

  ;; Flight actions (only allowed when a direct flight exists and on next-day transitions)
  (:action fly-oslo-to-dublin
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (present oslo ?d1)
      (flight_allowed oslo dublin)
      (not (present oslo ?d2))
      (not (present dublin ?d2))
      (not (present valencia ?d2))
    )
    :effect (present dublin ?d2)
  )

  (:action fly-dublin-to-oslo
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (present dublin ?d1)
      (flight_allowed dublin oslo)
      (not (present dublin ?d2))
      (not (present oslo ?d2))
      (not (present valencia ?d2))
    )
    :effect (present oslo ?d2)
  )

  (:action fly-dublin-to-valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (present dublin ?d1)
      (flight_allowed dublin valencia)
      (not (present dublin ?d2))
      (not (present valencia ?d2))
      (not (present oslo ?d2))
    )
    :effect (present valencia ?d2)
  )

  (:action fly-valencia-to-dublin
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (present valencia ?d1)
      (flight_allowed valencia dublin)
      (not (present valencia ?d2))
      (not (present dublin ?d2))
      (not (present oslo ?d2))
    )
    :effect (present dublin ?d2)
  )
)