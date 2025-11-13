(define (domain meeting_day)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location)
  (:constants
    golden_gate_park pacific_heights - location
  )
  (:predicates
    (at ?l - location)
    (time-09-00)
    (time-19-29)
    (arrived-ph-19-45)
    (john-available-19-45-20-45)
    (met-john-45)
  )
  (:functions (total-cost))
  (:action wait_to_19_29
    :precondition (time-09-00)
    :effect (and
      (not (time-09-00))
      (time-19-29)
      (increase (total-cost) 629)
    )
  )
  (:action move_ggp_to_ph_from_19_29
    :precondition (and
      (at golden_gate_park)
      (time-19-29)
    )
    :effect (and
      (not (at golden_gate_park))
      (at pacific_heights)
      (arrived-ph-19-45)
      (increase (total-cost) 16)
    )
  )
  (:action meet_john_45_from_19_45
    :precondition (and
      (at pacific_heights)
      (arrived-ph-19-45)
      (john-available-19-45-20-45)
      (not (met-john-45))
    )
    :effect (and
      (met-john-45)
      (increase (total-cost) 45)
    )
  )
)