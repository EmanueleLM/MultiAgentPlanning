(define (domain meetingplanningexample27)
  (:requirements :strips :typing :negative-preconditions :action-costs :numeric-fluents)
  (:types location)
  (:predicates
    (at ?l - location)
    (met-margaret)
  )
  (:functions
    (current-time)
    (total-cost)
  )

  (:action move-marina-to-pacific
    :precondition (and (at marina_district))
    :effect (and
      (not (at marina_district))
      (at pacific_heights)
      (increase (current-time) 7)
      (increase (total-cost) 7)
    )
  )

  (:action move-pacific-to-marina
    :precondition (and (at pacific_heights))
    :effect (and
      (not (at pacific_heights))
      (at marina_district)
      (increase (current-time) 6)
      (increase (total-cost) 6)
    )
  )

  (:action wait-1min
    :parameters ()
    :precondition (and)
    :effect (and
      (increase (current-time) 1)
      (increase (total-cost) 1)
    )
  )

  (:action meet-margaret-15min
    :precondition (and
      (at pacific_heights)
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