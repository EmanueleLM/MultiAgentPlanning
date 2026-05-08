(define (domain sf_meet_joseph)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler friend location time
  )

  (:predicates
    (at ?p - traveler ?l - location)
    (current_time ?t - time)
    (connected ?from - location ?to - location)
    (next_time ?t1 - time ?t2 - time)
    (friend_at ?f - friend ?l - location)
    (available_at ?f - friend ?t - time)
    (meeting_started ?f - friend)
    (must_continue_meeting ?f - friend)
    (met_minimum ?f - friend)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (must_continue_meeting joseph))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_ct_to_nh_at_0900
    :parameters ()
    :precondition (and
      (at you chinatown)
      (current_time t_0900)
      (connected chinatown nob_hill)
      (not (must_continue_meeting joseph))
    )
    :effect (and
      (not (at you chinatown))
      (at you nob_hill)
      (not (current_time t_0900))
      (current_time t_1100)
    )
  )

  (:action travel_ct_to_nh_at_1100
    :parameters ()
    :precondition (and
      (at you chinatown)
      (current_time t_1100)
      (connected chinatown nob_hill)
      (not (must_continue_meeting joseph))
    )
    :effect (and
      (not (at you chinatown))
      (at you nob_hill)
      (not (current_time t_1100))
      (current_time t_1130)
    )
  )

  (:action start_meeting_joseph
    :parameters ()
    :precondition (and
      (current_time t_1130)
      (at you nob_hill)
      (friend_at joseph nob_hill)
      (available_at joseph t_1130)
      (not (meeting_started joseph))
      (not (met_minimum joseph))
    )
    :effect (and
      (meeting_started joseph)
      (must_continue_meeting joseph)
    )
  )

  (:action continue_meeting_joseph_to_minimum
    :parameters ()
    :precondition (and
      (current_time t_1130)
      (meeting_started joseph)
      (must_continue_meeting joseph)
      (at you nob_hill)
      (friend_at joseph nob_hill)
      (available_at joseph t_1245)
      (next_time t_1130 t_1245)
    )
    :effect (and
      (not (current_time t_1130))
      (current_time t_1245)
      (not (must_continue_meeting joseph))
      (met_minimum joseph)
    )
  )
)