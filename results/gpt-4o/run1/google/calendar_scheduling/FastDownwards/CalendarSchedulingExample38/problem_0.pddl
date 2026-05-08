(define (problem schedule_meeting_monday)
  (:domain meeting_scheduler)
  (:objects
    participant_catherine participant_michael participant_alexander - participant
    timeslot_9_00_to_9_30 timeslot_9_30_to_10_00 timeslot_10_00_to_10_30
    timeslot_10_30_to_11_00 timeslot_11_00_to_11_30 timeslot_11_30_to_12_00
    timeslot_12_00_to_12_30 timeslot_12_30_to_13_00 timeslot_13_00_to_13_30
    timeslot_13_30_to_14_00 timeslot_14_00_to_14_30 timeslot_14_30_to_15_00
    timeslot_15_00_to_15_30 timeslot_15_30_to_16_00 timeslot_16_00_to_16_30
    timeslot_16_30_to_17_00 - timeslot
  )
  (:init
    (catherine_busy timeslot_10_30_to_11_00)
    (catherine_busy timeslot_12_30_to_13_00)
    (catherine_busy timeslot_14_30_to_15_00)
    (michael_busy timeslot_9_30_to_10_00)
    (michael_busy timeslot_12_00_to_12_30)
    (michael_busy timeslot_13_30_to_14_00)
    (michael_busy timeslot_15_00_to_15_30)
    (alexander_busy timeslot_9_00_to_9_30)
    (alexander_busy timeslot_10_00_to_10_30)
    (alexander_busy timeslot_11_00_to_12_00)
    (alexander_busy timeslot_13_00_to_13_30)
    (alexander_busy timeslot_14_00_to_16_00)
    (alexander_busy timeslot_16_30_to_17_00)
    
    ;; Determining the available times for each participant
    (available participant_catherine timeslot_9_00_to_9_30)
    (available participant_catherine timeslot_9_30_to_10_00)
    (available participant_catherine timeslot_11_00_to_11_30)
    (available participant_catherine timeslot_11_30_to_12_00)
    (available participant_catherine timeslot_12_00_to_12_30)
    (available participant_catherine timeslot_13_00_to_13_30)
    (available participant_catherine timeslot_13_30_to_14_00)
    (available participant_catherine timeslot_15_00_to_15_30)
    (available participant_catherine timeslot_15_30_to_16_00)
    (available participant_catherine timeslot_16_00_to_16_30)
    (available participant_catherine timeslot_16_30_to_17_00)

    (available participant_michael timeslot_9_00_to_9_30)
    (available participant_michael timeslot_10_00_to_10_30)
    (available participant_michael timeslot_10_30_to_11_00)
    (available participant_michael timeslot_11_00_to_11_30)
    (available participant_michael timeslot_11_30_to_12_00)
    (available participant_michael timeslot_12_30_to_13_00)
    (available participant_michael timeslot_14_00_to_14_30)
    (available participant_michael timeslot_14_30_to_15_00)
    (available participant_michael timeslot_15_30_to_16_00)
    (available participant_michael timeslot_16_00_to_16_30)
    (available participant_michael timeslot_16_30_to_17_00)

    (available participant_alexander timeslot_9_30_to_10_00)
    (available participant_alexander timeslot_10_30_to_11_00)
    (available participant_alexander timeslot_12_00_to_12_30)
    (available participant_alexander timeslot_12_30_to_13_00)
    (available participant_alexander timeslot_13_30_to_14_00)
    (available participant_alexander timeslot_16_00_to_16_30)
  )
  (:goal (meeting_scheduled))
)