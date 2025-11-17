(define (domain MeetingPlanningExample12)
  (:requirements :typing :negative-preconditions)
  (:types location friend timepoint)

  (:predicates
    ;; agent location
    (at ?l - location)
    ;; current discrete timepoint
    (time ?t - timepoint)
    ;; friend Barbara location
    (barbara-at ?l - location)
    ;; goal predicate: Barbara has been met
    (met-barbara)
    ;; connectivity (used to justify travel actions)
    (connected ?l1 ?l2 - location)
  )

  ;; Wait at North Beach from 09:00 to 17:44
  (:action wait_0900_to_1744
    :precondition (and
      (at north_beach)
      (time time_0900)
    )
    :effect (and
      (not (time time_0900))
      (time time_1744)
    )
  )

  ;; Travel from North Beach to Alamo Square departing at 17:44 and arriving at 18:00 (16 minutes)
  (:action move_nb_to_as_1744_to_1800
    :precondition (and
      (at north_beach)
      (time time_1744)
      (connected north_beach alamo_square)
    )
    :effect (and
      (not (at north_beach))
      (at alamo_square)
      (not (time time_1744))
      (time time_1800)
    )
  )

  ;; Meet Barbara starting at 18:00 and finishing at 21:30 (meeting duration = 210 minutes; satisfies >=90)
  (:action meet_barbara_1800_to_2130
    :precondition (and
      (at alamo_square)
      (time time_1800)
      (barbara-at alamo_square)
    )
    :effect (and
      (met-barbara)
      ;; advance the time to 21:30 to reflect the meeting occupying the entire window
      (not (time time_1800))
      (time time_2130)
    )
  )

  ;; Optional return action: Alamo Square -> North Beach (15 minutes)
  (:action move_as_to_nb_2130_to_2145
    :precondition (and
      (at alamo_square)
      (time time_2130)
      (connected alamo_square north_beach)
    )
    :effect (and
      (not (at alamo_square))
      (at north_beach)
      (not (time time_2130))
      (time time_2145)
    )
  )
)