(define (problem schedule_meeting_instance)
  (:domain meeting_scheduler)
  (:objects
    diana ethan janet - participant
    time_slot_09_00_to_09_30
    time_slot_10_00_to_10_30
    time_slot_11_00_to_11_30 - time_slot
  )
  (:init
    (available diana time_slot_09_00_to_09_30)
    (available diana time_slot_10_00_to_10_30)
    (available diana time_slot_11_00_to_11_30)

    (available ethan time_slot_09_00_to_09_30)
    (available ethan time_slot_10_00_to_10_30)
    (available ethan time_slot_11_00_to_11_30)

    (available janet time_slot_09_00_to_09_30)
    (available janet time_slot_10_00_to_10_30)
  )
  (:goal
    (meeting_held)
  )
)