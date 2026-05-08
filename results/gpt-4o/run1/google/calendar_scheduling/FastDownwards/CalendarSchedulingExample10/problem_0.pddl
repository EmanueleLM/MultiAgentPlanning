(define (problem schedule_meeting_instance)
  (:domain meeting_scheduler)
  (:objects
    diana ethan janet - participant
    time_slot_9_00_to_9_30
    time_slot_9_30_to_10_00
    time_slot_10_00_to_10_30
    time_slot_10_30_to_11_00
    time_slot_11_00_to_11_30
    time_slot_12_00_to_12_30
  )
  (:init
    (available diana time_slot_9_00_to_9_30)
    (available diana time_slot_9_30_to_10_00)
    (available diana time_slot_10_00_to_10_30)
    (available diana time_slot_10_30_to_11_00)
    (available diana time_slot_11_00_to_11_30)
    
    (available ethan time_slot_9_00_to_9_30)
    (available ethan time_slot_9_30_to_10_00)
    (available ethan time_slot_10_00_to_10_30)
    (available ethan time_slot_10_30_to_11_00)
    (available ethan time_slot_11_00_to_11_30)
    (available ethan time_slot_12_00_to_12_30)
    
    (available janet time_slot_10_00_to_10_30)
    (available janet time_slot_10_30_to_11_00)
    (available janet time_slot_11_00_to_11_30)
    
    (meeting_possible time_slot_9_00_to_9_30)
    (meeting_possible time_slot_9_30_to_10_00)
    (meeting_possible time_slot_10_00_to_10_30)
    (meeting_possible time_slot_10_30_to_11_00)
    (meeting_possible time_slot_11_00_to_11_30)
  )
  (:goal
    (meeting_held)
  )
)