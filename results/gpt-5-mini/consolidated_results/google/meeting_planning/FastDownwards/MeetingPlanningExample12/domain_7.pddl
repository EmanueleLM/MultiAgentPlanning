(define (domain meeting_planning_example12)
  (:requirements :strips :typing :negative-preconditions)
  (:types location timepoint person friend)

  (:predicates
    (at ?p - person ?l - location)
    (friend_at ?f - friend ?l - location)
    (now ?t - timepoint)
    (succ ?t1 - timepoint ?t2 - timepoint)
    (travel_slot ?from - location ?to - location ?tstart - timepoint ?tend - timepoint)
    (window ?f - friend ?tstart - timepoint ?tend - timepoint)
    (met ?f - friend)
  )

  ; Wait at North Beach from 09:00 to 17:44 (contiguous occupancy)
  (:action wait_nb_0900_1744
    :parameters ()
    :precondition (and
      (at me north_beach)
      (now t_0900)
      (succ t_0900 t_1744)
    )
    :effect (and
      (not (now t_0900))
      (now t_1744)
    )
  )

  ; Travel from North Beach to Alamo Square taking the exact slot 17:44 -> 18:00 (16 minutes)
  (:action move_nb_to_as_1744_1800
    :parameters ()
    :precondition (and
      (at me north_beach)
      (now t_1744)
      (travel_slot north_beach alamo_square t_1744 t_1800)
    )
    :effect (and
      (not (at me north_beach))
      (at me alamo_square)
      (not (now t_1744))
      (now t_1800)
    )
  )

  ; Meet Barbara continuously from 18:00 to 21:30 (meets minimum 90 minutes and uses full window chosen)
  (:action meet_barbara_1800_2130
    :parameters ()
    :precondition (and
      (at me alamo_square)
      (now t_1800)
      (friend_at barbara alamo_square)
      (window barbara t_1800 t_2130)
      (succ t_1800 t_2130)
    )
    :effect (and
      (met barbara)
      (not (now t_1800))
      (now t_2130)
    )
  )
)