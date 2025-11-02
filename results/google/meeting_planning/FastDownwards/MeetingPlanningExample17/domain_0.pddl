(define (domain meet-matthew-time)
  (:requirements :strips :typing :negative-preconditions :action-costs :numeric-fluents)
  (:types location)
  (:predicates
    (at ?l - location)
    (met_matthew)
  )
  (:functions
    (t)
    (total-cost)
  )

  (:action move_as_to_sd
    :precondition (at alamo_square)
    :effect (and
      (not (at alamo_square))
      (at sunset_district)
      (increase (t) 16)
      (increase (total-cost) 16)
    )
  )

  (:action move_sd_to_as
    :precondition (at sunset_district)
    :effect (and
      (not (at sunset_district))
      (at alamo_square)
      (increase (t) 17)
      (increase (total-cost) 17)
    )
  )

  (:action wait_1min
    :precondition ()
    :effect (and
      (increase (t) 1)
      (increase (total-cost) 1)
    )
  )

  (:action meet_matthew
    :precondition (and
      (at sunset_district)
      (not (met_matthew))
      (>= (t) 810)
      (<= (t) 855)
    )
    :effect (and
      (met_matthew)
      (increase (t) 15)
      (increase (total-cost) 15)
    )
  )
)