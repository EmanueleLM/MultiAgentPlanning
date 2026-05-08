(define (domain visit_friends_sf)
  (:requirements :strips :typing)
  (:types location person time_slot)
  (:constants chinatown nob_hill - location
              joseph - person
              slot_9_00 slot_9_08 slot_11_30 slot_12_45 slot_2_00 slot_3_15 - time_slot
  )
  (:predicates 
    (at ?loc - location ?time - time_slot)
    (friend_at ?person - person ?loc - location ?start_time - time_slot)
    (can_travel ?from - location ?to - location ?from_time - time_slot ?to_time - time_slot)
    (met ?person - person)
  )

  (:action travel
    :parameters (?from ?to - location ?from_time ?to_time - time_slot)
    :precondition (and 
      (at ?from ?from_time)
      (can_travel ?from ?to ?from_time ?to_time)
    )
    :effect (and 
      (not (at ?from ?from_time))
      (at ?to ?to_time)
    )
  )

  (:action meet_joseph
    :parameters (?time_start ?time_end - time_slot)
    :precondition (and 
      (at nob_hill ?time_start)
      (friend_at joseph nob_hill ?time_start)
      (can_travel nob_hill nob_hill ?time_start ?time_end)
      (not (met joseph))
    )
    :effect 
    (met joseph)
  )
  
)