(define (problem schedule_meeting_instance)
  (:domain meeting_scheduler)
  (:objects
    diana ethan janet - participant
    time_slot_10_00_to_10_30
    time_slot_10_30_to_11_00
  )
  (:init
    (available diana time_slot_10_00_to_10_30)
    (available diana time_slot_10_30_to_11_00)
    
    (available ethan time_slot_10_00_to_10_30)
    (available ethan time_slot_10_30_to_11_00)
    
    (available janet time_slot_10_00_to_10_30)
    (available janet time_slot_10_30_to_11_00)
    
    (meeting_possible time_slot_10_00_to_10_30)
    (meeting_possible time_slot_10_30_to_11_00)
  )
  (:goal
    (meeting_held)
  )
)