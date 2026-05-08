(define (problem schedule_specific_meeting)
  (:domain meeting_scheduling)
  (:objects
    jeffrey virginia melissa - participant
    timeslot_9_0 timeslot_9_30 timeslot_10_0 timeslot_10_30
    timeslot_11_0 timeslot_11_30 timeslot_12_0 timeslot_12_30
    timeslot_13_0 timeslot_13_30 timeslot_14_0 timeslot_14_30
    timeslot_15_0 timeslot_15_30 timeslot_16_0 timeslot_16_30 - timeslot
  )
  (:init
    ; Jeffrey's schedule
    (busy jeffrey timeslot_9_30)
    (busy jeffrey timeslot_10_30)
    
    ; Virginia's schedule
    (busy virginia timeslot_9_0)
    (busy virginia timeslot_10_0)
    (busy virginia timeslot_14_30)
    (busy virginia timeslot_16_0)
    
    ; Melissa's schedule
    (busy melissa timeslot_9_0)
    (busy melissa timeslot_11_0)
    (busy melissa timeslot_12_0)
    (busy melissa timeslot_13_0)
    (busy melissa timeslot_14_0)
    (busy melissa timeslot_16_0)
    
    ; Timeslot availability
    (available timeslot_9_0)
    (available timeslot_9_30)
    (available timeslot_10_30)
    (available timeslot_11_0)
    (available timeslot_11_30)
    (available timeslot_12_30)
    (available timeslot_13_30)
    (available timeslot_15_0)
    (available timeslot_15_30)
    
    ; Preference
    (preferred_before_14 melissa)
    
    ; Timeslot ordering
    (before timeslot_9_0 timeslot_14_0)
    (before timeslot_9_30 timeslot_14_0)
    (before timeslot_10_0 timeslot_14_0)
    (before timeslot_10_30 timeslot_14_0)
    (before timeslot_11_0 timeslot_14_0)
    (before timeslot_11_30 timeslot_14_0)
    (before timeslot_12_0 timeslot_14_0)
    (before timeslot_12_30 timeslot_14_0)
    (before timeslot_13_0 timeslot_14_0)
    (before timeslot_13_30 timeslot_14_0)
    (before timeslot_14_0 timeslot_14_30)
    
  )
  (:goal
    (exists (?ts - timeslot) (meeting_scheduled ?ts))
  )
)