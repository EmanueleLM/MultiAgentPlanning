(define (domain MeetingPlanningExample12)
  (:requirements :typing :negative-preconditions)
  (:types location friend timepoint)

  (:predicates
    ;; agent location
    (at ?l - location)
    ;; current discrete timepoint
    (time ?t - timepoint)
    ;; connectivity between locations (qualitative, travel actions additionally require a travel_slot linking specific timepoints)
    (connected ?l1 ?l2 - location)
    ;; Barbara's location
    (barbara-at ?l - location)
    ;; a travel slot encodes that departing at ?tstart from ?from arriving at ?tend at ?to is exactly the given travel duration
    (travel_slot ?from ?to ?tstart ?tend - timepoint)
    ;; Barbara's availability as a contiguous window from ?tstart to ?tend (both endpoints are explicit timepoints in the problem)
    (window_barbara ?tstart ?tend - timepoint)
    ;; goal predicate: Barbara has been met
    (met-barbara)
  )

  ;; Wait at North Beach from 09:00 to 17:44 (explicit discrete stage advance)
  (:action wait_0900_to_1744
    :parameters ()
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
  ;; This action is only applicable when the exact travel_slot is present; that enforces exact duration.
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

  ;; Meet Barbara starting at 18:00 and finishing at 21:30.
  ;; The meeting action requires that the entire scheduled interval (explicit endpoints) matches Barbara's availability window.
  ;; The meeting advances time contiguously from the start to the end timepoint, preventing other interleaved actions.
  (:action meet_barbara_1800_to_2130
    :parameters ()
    :precondition (and
      (at alamo_square)
      (time time_1800)
      (barbara-at alamo_square)
      (window_barbara time_1800 time_2130)
    )
    :effect (and
      (met-barbara)
      (not (time time_1800))
      (time time_2130)
    )
  )

  ;; Optional return action: Alamo Square -> North Beach (15 minutes), leaving after 21:30 and arriving at 21:45.
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