(define (problem schedule_meeting_monday)
  (:domain meeting_scheduler)
  (:objects 
    isabella ronald amanda - participant
    time_9 time_9_30 time_10 time_10_30 time_11 time_11_30 
    time_12 time_12_30 time_13 time_13_30 
    time_14 time_14_30 time_15 time_15_30
    time_16 time_16_30 - time_slot)
  (:init 
    (free isabella time_9)
    (free isabella time_9_30) 
    (free isabella time_10) 
    (free isabella time_10_30) 
    (free isabella time_11) 
    (free isabella time_12) 
    (free isabella time_12_30) 
    (free isabella time_13)

    (free ronald time_9) 
    (free ronald time_9_30) 
    (free ronald time_10) 
    (free ronald time_10_30)
    (free ronald time_12) 
    (free ronald time_12_30) 
    (free ronald time_13) 
    (free ronald time_14_30) 
    (free ronald time_15) 
    (free ronald time_15_30) 

    (free amanda time_9) 
    (free amanda time_12) 
    (free amanda time_12_30) 
    (free amanda time_13) 
    (free amanda time_13_30)

    (meets_preference isabella time_9) 
    (meets_preference isabella time_9_30) 
    (meets_preference isabella time_10) 
    (meets_preference isabella time_10_30) 
    (meets_preference isabella time_11) 
    (meets_preference isabella time_12) 
    (meets_preference isabella time_12_30))
  (:goal 
    (exists (?t - time_slot) (meeting_scheduled ?t))))