(define (domain MeetingPlanningExample9)
  ;; Domain for 5-minute discretized meeting planning between union_square and nob_hill.
  ;; Time is counted in 5-minute ticks. Initial time 0 corresponds to 09:00 local time.
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types person location)

  (:predicates
    (at ?p - person ?l - location)
  )

  (:functions
    (time)           ; current time in 5-minute ticks since 09:00
    (meet_ticks)     ; cumulative number of 5-minute meeting ticks with Mary
  )

  ;; Wait action: wait 5 minutes (1 tick) at current location.
  (:action wait_5
    :parameters (?p - person ?loc - location)
    :precondition (and (at ?p ?loc))
    :effect (and
      ;; time advances by 1 tick (5 minutes)
      (increase (time) 1)
    )
  )

  ;; Move Union Square -> Nob Hill: nominally 9 minutes -> rounded up to 10 minutes = 2 ticks.
  (:action move_union_square_to_nob_hill_9
    :parameters (?p - person)
    :precondition (and (at ?p union_square))
    :effect (and
      (not (at ?p union_square))
      (at ?p nob_hill)
      (increase (time) 2)
    )
  )

  ;; Move Nob Hill -> Union Square: nominally 7 minutes -> rounded up to 10 minutes = 2 ticks.
  (:action move_nob_hill_to_union_square_7
    :parameters (?p - person)
    :precondition (and (at ?p nob_hill))
    :effect (and
      (not (at ?p nob_hill))
      (at ?p union_square)
      (increase (time) 2)
    )
  )

  ;; Meet Mary for 5 minutes (1 tick).
  ;; Precondition enforces:
  ;;  - Traveler must be at nob_hill.
  ;;  - Current time must be within Mary's availability such that the 5-minute tick is fully inside [36,87] ticks.
  ;; Mary's availability in ticks: 12:00 is (12-9)*60/5 = 36 ticks; 16:15 is 87 ticks.
  (:action meet_mary_5
    :parameters (?p - person)
    :precondition (and
      (at ?p nob_hill)
      (>= (time) 36)
      (<= (+ (time) 1) 87)
    )
    :effect (and
      (increase (time) 1)
      (increase (meet_ticks) 1)
    )
  )
)