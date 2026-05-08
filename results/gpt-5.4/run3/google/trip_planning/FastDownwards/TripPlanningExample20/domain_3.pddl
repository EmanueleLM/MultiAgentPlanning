(define (domain trip_planning_example20)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:constants
    istanbul budapest dubrovnik - city
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited ?d - day ?c - city)
  )

  (:action start_in_city
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (not (at istanbul))
      (not (at budapest))
      (not (at dubrovnik))
      (not (visited ?d istanbul))
      (not (visited ?d budapest))
      (not (visited ?d dubrovnik))
    )
    :effect (and
      (at ?c)
      (visited ?d ?c)
    )
  )

  (:action stay
    :parameters (?from_day - day ?to_day - day ?c - city)
    :precondition (and
      (current_day ?from_day)
      (next ?from_day ?to_day)
      (at ?c)
      (not (visited ?to_day istanbul))
      (not (visited ?to_day budapest))
      (not (visited ?to_day dubrovnik))
    )
    :effect (and
      (not (current_day ?from_day))
      (current_day ?to_day)
      (visited ?to_day ?c)
    )
  )

  (:action fly
    :parameters (?from_day - day ?to_day - day ?from - city ?to - city)
    :precondition (and
      (current_day ?from_day)
      (next ?from_day ?to_day)
      (at ?from)
      (direct_flight ?from ?to)
      (not (visited ?to_day istanbul))
      (not (visited ?to_day budapest))
      (not (visited ?to_day dubrovnik))
    )
    :effect (and
      (not (current_day ?from_day))
      (current_day ?to_day)
      (not (at ?from))
      (at ?to)
      (visited ?to_day ?to)
    )
  )
)