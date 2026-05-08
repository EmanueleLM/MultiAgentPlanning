(define (domain meeting_planning_example12)
  (:requirements :strips :typing :negative-preconditions)
  (:types location timepoint agent friend)

  (:predicates
    ;; agent and friend locations
    (at_agent ?a - agent ?l - location)
    (at_friend ?f - friend ?l - location)

    ;; current discrete timepoint
    (now ?t - timepoint)

    ;; connectivity and anchored travel slots enforcing exact durations
    (connected ?from - location ?to - location)
    (travel_slot ?from - location ?to - location ?tstart - timepoint ?tend - timepoint)

    ;; Barbara's availability window anchored to discrete timepoints
    (window_barbara ?tstart - timepoint ?tend - timepoint)

    ;; goal predicate
    (met_barbara)
  )

  ;; Wait in North Beach from 09:00 to 17:44 (contiguous occupancy; no movement)
  (:action wait_nb_0900_1744
    :parameters ()
    :precondition (and
      (at_agent you north_beach)
      (now t_0900)
    )
    :effect (and
      (not (now t_0900))
      (now t_1744)
      ;; remain at north_beach (no change to at_agent you north_beach)
    )
  )

  ;; Travel North Beach -> Alamo Square exactly 16 minutes (1744 -> 1800)
  (:action move_nb_to_as_1744_1800
    :parameters ()
    :precondition (and
      (at_agent you north_beach)
      (now t_1744)
      (connected north_beach alamo_square)
      (travel_slot north_beach alamo_square t_1744 t_1800)
    )
    :effect (and
      (not (at_agent you north_beach))
      (at_agent you alamo_square)
      (not (now t_1744))
      (now t_1800)
    )
  )

  ;; Meet Barbara contiguously from 18:00 to 21:30 (meeting anchors entire window)
  (:action meet_barbara_1800_2130
    :parameters ()
    :precondition (and
      (at_agent you alamo_square)
      (now t_1800)
      (at_friend barbara alamo_square)
      (window_barbara t_1800 t_2130)
    )
    :effect (and
      (met_barbara)
      (not (now t_1800))
      (now t_2130)
      ;; remain at alamo_square for contiguous meeting occupancy
    )
  )
)