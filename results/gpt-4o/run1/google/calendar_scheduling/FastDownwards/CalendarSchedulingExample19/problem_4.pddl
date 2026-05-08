(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:objects 
    stephen edward angela - participant
    slot_9_00_to_10_00 
    slot_10_30_to_11_30 
    slot_11_30_to_12_30 
    slot_12_30_to_13_30 
    slot_13_00_to_14_00 
    slot_14_00_to_15_00 
    slot_15_30_to_16_30 
    slot_15_00_to_16_00 - time_slot
  )
  (:init
    (available stephen slot_9_00_to_10_00)
    (available stephen slot_11_30_to_12_30)
    (available stephen slot_12_30_to_13_30)
    (available stephen slot_14_00_to_15_00)
    (available stephen slot_15_30_to_16_30)
    (available stephen slot_16_00_to_17_00)
    (available edward slot_11_30_to_12_30)
    (available edward slot_12_30_to_13_30)
    (available edward slot_14_00_to_15_00)
    (available edward slot_16_00_to_17_00)
    (available angela slot_11_30_to_12_30)
    (available angela slot_12_30_to_13_30)
  )
  (:goal
    (exists (?s - time_slot) 
      (and 
        (meeting_scheduled ?s)
      )
    )
  )
)