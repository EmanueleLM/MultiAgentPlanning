(define (domain meeting_planning_example12)
  (:requirements :typing :negative-preconditions)
  (:types location friend timepoint)

  (:predicates
    (at ?l - location)
    (time ?t - timepoint)
    (connected ?from - location ?to - location)
    (travel_slot ?from - location ?to - location ?tstart - timepoint ?tend - timepoint)
    (window_barbara ?tstart - timepoint ?tend - timepoint)
    (barbara_at ?l - location)
    (met_barbara)
  )

  (:action wait_0900_to_1744
    :parameters ()
    :precondition (and
      (at north_beach)
      (time time_0900)
    )
    :effect (and
      (not (time time_0900))
      (time time_1744)
      ;; remain at north_beach (no change to (at north_beach))
    )
  )

  (:action move_nb_to_as_1744_to_1800
    :parameters ()
    :precondition (and
      (at north_beach)
      (time time_1744)
      (connected north_beach alamo_square)
      (travel_slot north_beach alamo_square time_1744 time_1800)
    )
    :effect (and
      (not (at north_beach))
      (at alamo_square)
      (not (time time_1744))
      (time time_1800)
    )
  )

  (:action meet_barbara_1800_to_2130
    :parameters ()
    :precondition (and
      (at alamo_square)
      (time time_1800)
      (barbara_at alamo_square)
      (window_barbara time_1800 time_2130)
    )
    :effect (and
      (met_barbara)
      (not (time time_1800))
      (time time_2130)
      ;; remain at alamo_square for contiguous occupancy during meeting
    )
  )

  (:action move_as_to_nb_2130_to_2145
    :parameters ()
    :precondition (and
      (at alamo_square)
      (time time_2130)
      (connected alamo_square north_beach)
      (travel_slot alamo_square north_beach time_2130 time_2145)
    )
    :effect (and
      (not (at alamo_square))
      (at north_beach)
      (not (time time_2130))
      (time time_2145)
    )
  )
)