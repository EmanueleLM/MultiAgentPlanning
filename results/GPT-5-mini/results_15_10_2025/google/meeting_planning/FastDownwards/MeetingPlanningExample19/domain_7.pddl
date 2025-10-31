(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :fluents :adl)
  (:types agent place)
  (:constants traveler john - agent ggp ph - place)
  (:predicates
    (at ?a - agent ?p - place)
    (met-john)
  )
  (:functions (current-time))

  (:action travel_traveler_ggp_to_ph
    :parameters ()
    :precondition (and
      (at traveler ggp)
      (not (met-john))
    )
    :effect (and
      (not (at traveler ggp))
      (at traveler ph)
      (increase (current-time) 16)
    )
  )

  (:action travel_traveler_ph_to_ggp
    :parameters ()
    :precondition (and
      (at traveler ph)
      (not (met-john))
    )
    :effect (and
      (not (at traveler ph))
      (at traveler ggp)
      (increase (current-time) 15)
    )
  )

  (:action wait_one_minute
    :parameters ()
    :precondition (and
      (not (met-john))
    )
    :effect (and
      (increase (current-time) 1)
    )
  )

  (:action meet_john
    :parameters ()
    :precondition (and
      (at traveler ph)
      (at john ph)
      (not (met-john))
      ;; John's availability window: 19:45 (1185) to 20:45 (1245)
      ;; meeting must start no earlier than 1185 and no later than 1200 so that 45-minute meeting fits by 1245
      (>= (current-time) 1185)
      (<= (current-time) 1200)
      ;; ensure meeting of 45 minutes finishes by 1245
      (<= (+ (current-time) 45) 1245)
    )
    :effect (and
      (met-john)
      (increase (current-time) 45)
    )
  )
)