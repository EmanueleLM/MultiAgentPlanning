(define (domain visit_friends_sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time_slot)
  (:constants chinatown nob_hill - location
              joseph - person
              slot_9_00 slot_9_08 slot_11_30 slot_11_45 slot_1_00 slot_2_15 slot_3_15 - time_slot
  )
  (:predicates 
    (at ?loc - location ?time - time_slot)
    (friend_at ?person - person ?loc - location ?time - time_slot)
    (met ?person - person)
    (ready_to_meet ?time - time_slot)
  )

  (:action travel_to_nob_hill
    :parameters (?from_time - time_slot ?to_time - time_slot)
    :precondition (and 
      (at chinatown ?from_time)
      (or (and (= ?from_time slot_9_00) (= ?to_time slot_9_08))))
    :effect (and 
      (not (at chinatown ?from_time))
      (at nob_hill ?to_time)
    )
  )

  (:action travel_to_chinatown
    :parameters (?from_time - time_slot ?to_time - time_slot)
    :precondition (and 
      (at nob_hill ?from_time)
      (or (and (= ?from_time slot_11_45) (= ?to_time slot_1_00))
          (and (= ?from_time slot_2_15) (= ?to_time slot_3_15))))
    :effect (and 
      (not (at nob_hill ?from_time))
      (at chinatown ?to_time)
    )
  )

  (:action start_meeting_joseph
    :parameters (?time - time_slot)
    :precondition (and 
      (at nob_hill ?time)
      (friend_at joseph nob_hill ?time)
      (not (met joseph))
    )
    :effect (ready_to_meet ?time)
  )

  (:action continue_meeting_joseph
    :parameters (?time1 - time_slot ?time2 - time_slot)
    :precondition (and 
      (at nob_hill ?time1)
      (ready_to_meet ?time1)
      (or (and (= ?time1 slot_11_30) (= ?time2 slot_11_45))
          (and (= ?time1 slot_11_45) (= ?time2 slot_1_00))
          (and (= ?time1 slot_1_00) (= ?time2 slot_2_15))))
    :effect (and 
      (not (at nob_hill ?time1))
      (at nob_hill ?time2)
    )
  )

  (:action stop_meeting_joseph
    :parameters (?time - time_slot)
    :precondition (and 
      (at nob_hill ?time)
      (ready_to_meet slot_11_30)
      (ready_to_meet slot_11_45)
      (ready_to_meet slot_1_00)
      (ready_to_meet slot_2_15)
    )
    :effect (met joseph)
  )
)