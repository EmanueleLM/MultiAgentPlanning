(define (problem schedule_meeting_monday)
  (:domain meeting_scheduler)
  (:objects
    catherine michael alexander - participant
    timeslot_9_00_to_9_30 timeslot_9_30_to_10_00
    timeslot_10_00_to_10_30 timeslot_10_30_to_11_00
    timeslot_11_00_to_11_30 timeslot_11_30_to_12_00
    timeslot_12_00_to_12_30 timeslot_12_30_to_13_00
    timeslot_13_00_to_13_30 timeslot_13_30_to_14_00
    timeslot_14_00_to_14_30 timeslot_14_30_to_15_00
    timeslot_15_00_to_15_30 timeslot_15_30_to_16_00
    timeslot_16_00_to_16_30 timeslot_16_30_to_17_00 - timeslot
  )
  (:init
    (busy catherine timeslot_10_30_to_11_00)
    (busy catherine timeslot_12_30_to_13_00)
    (busy catherine timeslot_14_30_to_15_00)
    (busy michael timeslot_9_30_to_10_00)
    (busy michael timeslot_12_00_to_12_30)
    (busy michael timeslot_13_30_to_14_00)
    (busy michael timeslot_15_00_to_15_30)
    (busy alexander timeslot_9_00_to_9_30)
    (busy alexander timeslot_10_00_to_10_30)
    (busy alexander timeslot_11_00_to_11_30)
    (busy alexander timeslot_13_00_to_13_30)
    (busy alexander timeslot_14_00_to_14_30)
    (busy alexander timeslot_14_30_to_15_00)
    (busy alexander timeslot_15_00_to_15_30)
    (busy alexander timeslot_15_30_to_16_00)
    (busy alexander timeslot_16_30_to_17_00)
    
    (available catherine timeslot_9_00_to_9_30)
    (available catherine timeslot_9_30_to_10_00)
    (available catherine timeslot_11_00_to_11_30)
    (available catherine timeslot_11_30_to_12_00)
    (available catherine timeslot_12_00_to_12_30)
    (available catherine timeslot_13_00_to_13_30)
    (available catherine timeslot_13_30_to_14_00)
    (available catherine timeslot_15_00_to_15_30)
    (available catherine timeslot_15_30_to_16_00)
    (available catherine timeslot_16_00_to_16_30)
    (available catherine timeslot_16_30_to_17_00)

    (available michael timeslot_9_00_to_9_30)
    (available michael timeslot_10_00_to_10_30)
    (available michael timeslot_10_30_to_11_00)
    (available michael timeslot_11_00_to_11_30)
    (available michael timeslot_11_30_to_12_00)
    (available michael timeslot_12_30_to_13_00)
    (available michael timeslot_14_00_to_14_30)
    (available michael timeslot_14_30_to_15_00)
    (available michael timeslot_15_30_to_16_00)
    (available michael timeslot_16_00_to_16_30)
    (available michael timeslot_16_30_to_17_00)

    (available alexander timeslot_9_30_to_10_00)
    (available alexander timeslot_10_30_to_11_00)
    (available alexander timeslot_12_00_to_12_30)
    (available alexander timeslot_12_30_to_13_00)
    (available alexander timeslot_13_30_to_14_00)
    (available alexander timeslot_16_00_to_16_30)
  )
  (:goal (meeting_scheduled))
)