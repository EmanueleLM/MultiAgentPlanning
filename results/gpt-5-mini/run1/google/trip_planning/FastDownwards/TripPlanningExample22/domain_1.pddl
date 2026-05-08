(define (domain trip_planning_domain22)
  (:requirements :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (day_assigned ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct_flight ?c1 - city ?c2 - city)
    (visited ?c - city)
  )

  ;; Start the trip on day1 in any chosen city (only allowed for day1).
  (:action start_day1
    :parameters (?c - city)
    :precondition (not (day_assigned day1))
    :effect (and
      (at ?c day1)
      (day_assigned day1)
      (visited ?c)
    )
  )

  ;; Stay in the same city from a previous day to the next day.
  (:action stay
    :parameters (?c - city ?prev - day ?d - day)
    :precondition (and
      (at ?c ?prev)
      (next ?prev ?d)
      (not (day_assigned ?d))
    )
    :effect (and
      (at ?c ?d)
      (day_assigned ?d)
      (visited ?c)
    )
  )

  ;; Move between two different cities when a direct flight exists.
  (:action move
    :parameters (?cfrom - city ?cto - city ?prev - day ?d - day)
    :precondition (and
      (at ?cfrom ?prev)
      (next ?prev ?d)
      (direct_flight ?cfrom ?cto)
      (not (day_assigned ?d))
    )
    :effect (and
      (at ?cto ?d)
      (day_assigned ?d)
      (visited ?cto)
    )
  )
)