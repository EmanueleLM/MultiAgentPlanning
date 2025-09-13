(define (problem integrated_find_meeting_slot)
  (:domain integrated_meeting_scheduler)
  
  (:objects 
      9:00 9:30 10:00 10:30 11:00 11:30 12:00 12:30 
      13:00 13:30 14:00 14:30 15:00 15:30 16:00 16:30 17:00 
      - time
      slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 
      slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 
      slot_14_30 slot_15_00 slot_15_30 slot_16_00 
      - slot
  )

  (:init
    ; Available slots from agents
    (available 9:00 9:30) 
    (available 9:30 10:00) 
    (available 10:00 10:30) 
    (available 10:30 11:00) 
    (available 11:00 11:30) 
    (available 11:30 12:00) 
    (available 12:00 12:30)
    (available 12:30 13:00)
    (available 13:00 13:30)
    (available 13:30 14:00)
    (available 14:00 14:30)
    (available 14:30 15:00)
    (available 15:00 15:30)
    (available 16:00 16:30)
    (available 16:30 17:00)

    ; Agent-specific available slots
    (available slot_9_00)
    (available slot_9_30)
    (available slot_10_00)
    (available slot_10_30)
    (available slot_11_00)
    (available slot_12_00)
    (available slot_12_30)
    (available slot_13_00)
    (available slot_13_30)
    (available slot_14_00)
    (available slot_14_30)
    (available slot_15_00)
    (available slot_15_30)
    (available slot_16_00)

    ; Busy slots affecting meeting scheduling
    (busy 14:00 14:30)
    (busy 15:30 16:00)
  )
  
  (:goal 
    (exists (?start ?end - time) (scheduled ?start ?end))
  )
)