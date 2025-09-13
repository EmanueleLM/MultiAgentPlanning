(define (problem unified_schedule_meeting_problem_classical)
  (:domain unified_schedule_meeting_classical)
  
  (:objects
    arthur michael samantha - person
    slot_9_00_to_10_00 slot_10_00_to_11_00 slot_11_00_to_12_00 
    slot_12_00_to_13_00 slot_13_00_to_14_00 slot_14_00_to_15_00
    slot_15_00_to_16_00 slot_16_00_to_17_00 - time_slot
  )
  
  (:init
    (available arthur slot_9_00_to_10_00)
    (available arthur slot_12_00_to_13_00)
    (available arthur slot_13_00_to_14_00)
    (available arthur slot_14_00_to_15_00)

    (available michael slot_9_00_to_10_00)
    (available michael slot_10_00_to_11_00)
    (available michael slot_11_00_to_12_00)
    (available michael slot_15_00_to_16_00)
    
    (available samantha slot_9_00_to_10_00)

    (next slot_9_00_to_10_00 slot_10_00_to_11_00)
    (next slot_10_00_to_11_00 slot_11_00_to_12_00)
    (next slot_11_00_to_12_00 slot_12_00_to_13_00)
    (next slot_12_00_to_13_00 slot_13_00_to_14_00)
    (next slot_13_00_to_14_00 slot_14_00_to_15_00)
    (next slot_14_00_to_15_00 slot_15_00_to_16_00)
    (next slot_15_00_to_16_00 slot_16_00_to_17_00)
  )
  
  (:goal
    (exists (?slot - time_slot)
      (meeting_scheduled ?slot)
    )
  )
)