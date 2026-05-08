(define (domain trip_planning_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (succ ?d1 - day ?d2 - day)        ; ordering of days
    (direct_flight ?c1 - city ?c2 - city)
    (at ?c - city ?d - day)          ; traveler is in city ?c on day ?d
    (assigned ?d - day)              ; day ?d has already been assigned to some city
  )

  ;; Assign a city to an unassigned day
  (:action assign_day
    :parameters (?c - city ?d - day)
    :precondition (and
      (not (assigned ?d))
    )
    :effect (and
      (at ?c ?d)
      (assigned ?d)
    )
  )

  ;; Stay in the same city on the successor day (carry city forward)
  (:action stay_same_city
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (succ ?d1 ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (assigned ?d2)
    )
  )

  ;; Fly from c1 on day d1 to c2 on successor day d2 (requires direct flight)
  (:action fly_to_next_day
    :parameters (?c1 - city ?c2 - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c1 ?d1)
      (succ ?d1 ?d2)
      (not (assigned ?d2))
      (direct_flight ?c1 ?c2)
    )
    :effect (and
      (at ?c2 ?d2)
      (assigned ?d2)
    )
  )
)