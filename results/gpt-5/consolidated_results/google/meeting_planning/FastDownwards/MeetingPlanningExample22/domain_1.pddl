(define (domain meetingplanningexample22)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents :action-costs)
  (:types location)
  (:constants
    presidio union_square - location
  )
  (:predicates
    (at ?l - location)
    (met_andrew)
  )
  (:functions
    (time)
    (total-cost)
  )

  ; Waiting actions (allowed only before meeting; cost equals elapsed time)
  (:action wait_60
    :precondition (and (not (met_andrew)))
    :effect (and
      (increase (time) 60)
      (increase (total-cost) 60)
    )
  )
  (:action wait_30
    :precondition (and (not (met_andrew)))
    :effect (and
      (increase (time) 30)
      (increase (total-cost) 30)
    )
  )
  (:action wait_15
    :precondition (and (not (met_andrew)))
    :effect (and
      (increase (time) 15)
      (increase (total-cost) 15)
    )
  )
  (:action wait_8
    :precondition (and (not (met_andrew)))
    :effect (and
      (increase (time) 8)
      (increase (total-cost) 8)
    )
  )

  ; Travel actions (cost equals travel time)
  (:action travel_presidio_union
    :precondition (and (at presidio))
    :effect (and
      (not (at presidio))
      (at union_square)
      (increase (time) 22)
      (increase (total-cost) 22)
    )
  )
  (:action travel_union_presidio
    :precondition (and (at union_square))
    :effect (and
      (not (at union_square))
      (at presidio)
      (increase (time) 24)
      (increase (total-cost) 24)
    )
  )

  ; Meet Andrew for 105 minutes within his availability.
  ; Start must be in [675,930] so that finish time is <= 1035.
  (:action meet_andrew_105
    :precondition (and
      (at union_square)
      (not (met_andrew))
      (>= (time) 675)
      (<= (time) 930)
    )
    :effect (and
      (met_andrew)
      (increase (time) 105)
      (increase (total-cost) 0)
    )
  )
)