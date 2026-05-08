(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day planner)
  (:predicates
    (current_city ?p - planner ?c - city)
    (visited ?p - planner ?c - city)
    (day_in_trip ?d - day)
    (consecutive ?d1 - day ?d2 - day)
    (can_fly ?c1 - city ?c2 - city)
  )
  (:action fly
    :parameters (?p - planner ?c1 - city ?c2 - city)
    :precondition (and
      (current_city ?p ?c1)
      (not (visited ?p ?c2))
      (can_fly ?c1 ?c2)
    )
    :effect (and
      (not (current_city ?p ?c1))
      (current_city ?p ?c2)
      (visited ?p ?c2)
    )
  )
  (:action move_to_next_day
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (day_in_trip ?d1)
      (consecutive ?d1 ?d2)
    )
    :effect (and
      (not (day_in_trip ?d1))
      (day_in_trip ?d2)
    )
  )
)