(define (problem schedule_specific_meeting)
  (:domain meeting_scheduling)
  (:objects
    jeffrey virginia melissa - participant
    timeslot_9_0 timeslot_9_30 timeslot_10_0 timeslot_10_30
    timeslot_11_0 timeslot_11_30 timeslot_12_0 timeslot_12_30
    timeslot_13_0 timeslot_13_30 timeslot_14_0 timeslot_14_30
    timeslot_15_0 timeslot_15_30 timeslot_16_0 - timeslot
  )
  (:init
    ; Jeffrey is busy
    (busy jeffrey timeslot_9_30)
    (busy jeffrey timeslot_10_0)
    
    ; Virginia is busy
    (busy virginia timeslot_9_0)
    (busy virginia timeslot_10_0)
    (busy virginia timeslot_14_30)
    (busy virginia timeslot_16_0)
    
    ; Melissa is busy
    (busy melissa timeslot_9_0)
    (busy melissa timeslot_10_0)
    (busy melissa timeslot_11_0)
    (busy melissa timeslot_12_0)
    (busy melissa timeslot_13_0)
    (busy melissa timeslot_14_0)
    (busy melissa timeslot_16_0)
    
    ; Timeslot availability
    (available timeslot_9_0)
    (available timeslot_10_0)
    (available timeslot_11_0)
    (available timeslot_11_30)
    (available timeslot_12_0)
    (available timeslot_12_30)
    (available timeslot_13_30)
    (available timeslot_15_0)
    (available timeslot_15_30)
    
    ; Melissa's preference
    (preferred_before_14 melissa)
  )
  (:goal
    (exists (?ts - timeslot) (meeting_scheduled ?ts))
  )
)