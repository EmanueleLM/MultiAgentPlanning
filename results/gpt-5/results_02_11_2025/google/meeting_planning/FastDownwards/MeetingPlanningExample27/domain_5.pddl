(define (domain meetingplanningexample27-strips)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location)
  (:constants
    marina_district pacific_heights - location
  )
  (:predicates
    (at ?l - location)
    (idle)
    (met-margaret)
  )
  (:functions
    (current-time) - number
    (total-cost) - number
  )

  (:action move-marina-to-pacific
    :parameters ()
    :precondition (and (at marina_district) (idle))
    :effect (and
      (not (at marina_district))
      (at pacific_heights)
      (increase (current-time) 7)
      (increase (total-cost) 7)
    )
  )

  (:action move-pacific-to-marina
    :parameters ()
    :precondition (and (at pacific_heights) (idle))
    :effect (and
      (not (at pacific_heights))
      (at marina_district)
      (increase (current-time) 6)
      (increase (total-cost) 6)
    )
  )

  (:action wait-1min
    :parameters ()
    :precondition (idle)
    :effect (and
      (increase (current-time) 1)
      (increase (total-cost) 1)
    )
  )

  (:action meet-margaret-15min
    :parameters ()
    :precondition (and
      (at pacific_heights)
      (idle)
      (not (met-margaret))
      (>= (current-time) 1140)
      (<= (+ (current-time) 15) 1185)
    )
    :effect (and
      (met-margaret)
      (increase (current-time) 15)
      (increase (total-cost) 15)
    )
  )
)