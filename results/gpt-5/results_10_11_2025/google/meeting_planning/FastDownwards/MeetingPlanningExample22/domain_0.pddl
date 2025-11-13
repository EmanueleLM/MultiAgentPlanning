(define (domain meet-andrew)
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

  ; Waiting actions (cost equals elapsed time). Disallowed after meeting to prevent idle time.
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

  ; Outbound travel: only from Presidio to Union Square, earliest sensible departure 653 to avoid unnecessary early arrival.
  (:action travel_presidio_union
    :precondition (and
      (at presidio)
      (not (met_andrew))
      (>= (time) 653)
    )
    :effect (and
      (not (at presidio))
      (at union_square)
      (increase (time) 22)
      (increase (total-cost) 22)
    )
  )

  ; Return travel allowed only after meeting Andrew (prevents back-and-forth before meeting).
  (:action travel_union_presidio
    :precondition (and
      (at union_square)
      (met_andrew)
    )
    :effect (and
      (not (at union_square))
      (at presidio)
      (increase (time) 24)
      (increase (total-cost) 24)
    )
  )

  ; Meeting Andrew for at least 105 minutes within [11:15,17:15]; start must be in [675,930].
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