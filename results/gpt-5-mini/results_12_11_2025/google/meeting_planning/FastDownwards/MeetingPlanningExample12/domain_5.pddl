(define (domain meeting_planning_example12)
  (:requirements :strips :typing :negative-preconditions)
  (:types location timepoint agent friend)

  (:predicates
    (at ?a - agent ?l - location)
    (friend_at ?f - friend ?l - location)

    ;; current discrete timepoint: exactly one now(...) will hold
    (now ?t - timepoint)

    ;; ordered timepoints / anchors (succ defines allowed contiguous jumps)
    (succ ?t1 - timepoint ?t2 - timepoint)

    ;; travel slot tying a specific origin, destination and exact time jump
    (travel_slot ?from - location ?to - location ?tstart - timepoint ?tend - timepoint)

    ;; friend's availability window anchored to exact timepoints
    (window ?f - friend ?tstart - timepoint ?tend - timepoint)

    ;; goal predicate
    (met_barbara)
  )

  ;; Wait at North Beach from 09:00 to 17:44 (contiguous occupancy)
  (:action wait_nb_0900_1744
    :parameters ()
    :precondition (and
      (at you north_beach)
      (now t_0900)
      (succ t_0900 t_1744)
    )
    :effect (and
      (not (now t_0900))
      (now t_1744)
      ;; remain at north_beach implicitly by not changing (at you north_beach)
    )
  )

  ;; Travel North Beach -> Alamo Square exactly using the travel_slot t_1744 -> t_1800
  (:action move_nb_to_as_1744_1800
    :parameters ()
    :precondition (and
      (at you north_beach)
      (now t_1744)
      (travel_slot north_beach alamo_square t_1744 t_1800)
    )
    :effect (and
      (not (at you north_beach))
      (at you alamo_square)
      (not (now t_1744))
      (now t_1800)
    )
  )

  ;; Meet Barbara contiguously from 18:00 to 21:30 (meeting anchors the entire required window)
  (:action meet_barbara_1800_2130
    :parameters ()
    :precondition (and
      (at you alamo_square)
      (now t_1800)
      (friend_at barbara alamo_square)
      (window barbara t_1800 t_2130)
      (succ t_1800 t_2130)
    )
    :effect (and
      (met_barbara)
      (not (now t_1800))
      (now t_2130)
      ;; remain at alamo_square for contiguous meeting occupancy
    )
  )
)