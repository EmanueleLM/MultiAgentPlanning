(define (problem schedule_meeting_monday)
  (:domain meeting_scheduler)
  (:objects 
    roy kathryn amy - participant
    monday_slot_9_30_10_00 monday_slot_10_30_11_00 monday_slot_11_30_12_00
    monday_slot_12_00_12_30 monday_slot_13_00_13_30 monday_slot_13_30_14_00 
    monday_slot_14_30_15_00 monday_slot_15_00_15_30 monday_slot_15_30_16_00 
    - time_slot
    meeting - meeting
  )
  
  (:init
    ;; Roy's availability
    (available roy monday_slot_9_30_10_00)
    (available roy monday_slot_10_30_11_00)
    (available roy monday_slot_11_30_12_00)
    (available roy monday_slot_12_00_12_30)
    (available roy monday_slot_13_00_13_30)
    (available roy monday_slot_13_30_14_00)
    (available roy monday_slot_14_30_15_00)
    (available roy monday_slot_15_00_15_30)
    (available roy monday_slot_15_30_16_00)
    
    ;; Kathryn's availability
    (available kathryn monday_slot_9_30_10_00)
    (available kathryn monday_slot_10_30_11_00)
    (available kathryn monday_slot_11_30_12_00)
    (available kathryn monday_slot_12_00_12_30)
    (available kathryn monday_slot_13_00_13_30)
    (available kathryn monday_slot_13_30_14_00)
    (available kathryn monday_slot_15_00_15_30)
    (available kathryn monday_slot_15_30_16_00)
    
    ;; Amy's availability
    (available amy monday_slot_14_30_15_00)
    (available amy monday_slot_15_00_15_30)
    (available amy monday_slot_15_30_16_00)
    
    ;; Preference constraints
    (not_before_preference amy monday_slot_15_30_16_00)
  )

  (:goal
    (exists (?t - time_slot)
      (meeting_scheduled meeting ?t)
    )
  )
)