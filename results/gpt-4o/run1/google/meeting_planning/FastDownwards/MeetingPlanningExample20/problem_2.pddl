(define (problem visit_friends_sf_instance)
  (:domain visit_friends_sf)
  (:objects 
    chinatown nob_hill - location
    joseph - person
    slot_9_00 slot_9_08 slot_11_30 slot_12_45 slot_2_00 slot_3_15 - time_slot
  )
  (:init 
    (at chinatown slot_9_00)
    (friend_at joseph nob_hill slot_11_30)
    (can_travel chinatown nob_hill slot_9_00 slot_9_08)
    (can_travel nob_hill chinatown slot_12_45 slot_2_00)
    (can_travel nob_hill nob_hill slot_11_30 slot_12_45)
    (can_travel nob_hill nob_hill slot_12_45 slot_2_00)
    (can_travel nob_hill nob_hill slot_2_00 slot_3_15)
    (not (met joseph))
  )
  (:goal 
    (met joseph)
  )
)