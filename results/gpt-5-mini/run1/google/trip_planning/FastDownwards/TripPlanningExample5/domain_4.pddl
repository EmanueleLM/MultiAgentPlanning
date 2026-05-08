(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types agent day city)

  (:predicates
    ;; successor relation between days
    (next ?d1 - day ?d2 - day)

    ;; direct flight connectivity between cities
    (direct ?from - city ?to - city)

    ;; agent located in a city on a particular day
    (at ?a - agent ?c - city ?d - day)

    ;; token indicating a day has not yet been assigned (true => unassigned)
    (day_free ?d - day)
  )

  ;; Stay in same city on successor day: assign the successor day the same city
  (:action stay_assign
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?c ?d1) (next ?d1 ?d2) (day_free ?d2))
    :effect (and
      (at ?a ?c ?d2)
      (not (day_free ?d2))
    )
  )

  ;; Fly (direct) to another city for the successor day: assign the successor day the destination city
  (:action fly_assign
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?from ?d1) (direct ?from ?to) (next ?d1 ?d2) (day_free ?d2))
    :effect (and
      (at ?a ?to ?d2)
      (not (day_free ?d2))
    )
  )
)