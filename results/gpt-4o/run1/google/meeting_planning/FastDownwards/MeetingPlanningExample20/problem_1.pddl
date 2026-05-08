(define (problem visit_friends_sf_instance)
  (:domain visit_friends_sf)
  (:objects 
    chinatown nob_hill - location
    joseph - person
    slot_9_00 slot_9_08 slot_11_30 slot_11_45 slot_1_00 slot_2_15 slot_3_15 - time_slot
  )
  (:init 
    (at chinatown slot_9_00)
    (friend_at joseph nob_hill slot_11_30)
    (friend_at joseph nob_hill slot_11_45)
    (friend_at joseph nob_hill slot_1_00)
    (friend_at joseph nob_hill slot_2_15)
    (friend_at joseph nob_hill slot_3_15)
    (not (met joseph))
  )
  (:goal 
    (met joseph)
  )
)