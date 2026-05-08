(define (domain trip_planning_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)            ; traveler is in city ?c on day ?d
    (direct_flight ?c1 - city ?c2 - city)
    (next_day ?d1 - day ?d2 - day)    ; temporal ordering of days
    (occupied ?d - day)               ; some city is assigned on day ?d (prevents double assignment)
  )

  ;; Stay in the same city from one day to the next (assigns the next day to same city)
  (:action stay
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (at ?c ?d)
      (next_day ?d ?dnext)
      (not (occupied ?dnext))
    )
    :effect (and
      (at ?c ?dnext)
      (occupied ?dnext)
    )
  )

  ;; Fly (direct) from one city to another between consecutive days
  (:action fly
    :parameters (?cfrom - city ?cto - city ?d - day ?dnext - day)
    :precondition (and
      (at ?cfrom ?d)
      (next_day ?d ?dnext)
      (direct_flight ?cfrom ?cto)
      (not (occupied ?dnext))
    )
    :effect (and
      (at ?cto ?dnext)
      (occupied ?dnext)
    )
  )
)