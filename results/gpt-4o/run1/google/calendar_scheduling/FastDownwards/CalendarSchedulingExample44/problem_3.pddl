(define (problem schedule_meeting_monday)
  (:domain meeting_scheduler)
  (:objects 
    isabella ronald amanda - participant
    hour_9 hour_9_30 hour_10 hour_10_30 hour_11 hour_11_30 
    hour_12 hour_12_30 hour_13 hour_13_30
    hour_14 hour_14_30 hour_15 hour_15_30
    hour_16 hour_16_30 - start_time)
  (:init 
    (free isabella hour_9) (free isabella hour_9_30) 
    (free isabella hour_10) (free isabella hour_10_30) 
    (free isabella hour_11) 
    (free isabella hour_12) (free isabella hour_12_30) 
    (free isabella hour_13)
    
    (free ronald hour_9) (free ronald hour_9_30) 
    (free ronald hour_10) (free ronald hour_10_30)
    (free ronald hour_12) (free ronald hour_12_30) 
    (free ronald hour_13) 
    (free ronald hour_14_30) (free ronald hour_15) 
    (free ronald hour_15_30) 

    (free amanda hour_9) 
    (free amanda hour_12) 
    (free amanda hour_12_30) 
    (free amanda hour_13) 
    (free amanda hour_13_30)

    (meets_preference isabella hour_9) 
    (meets_preference isabella hour_9_30) 
    (meets_preference isabella hour_10) 
    (meets_preference isabella hour_10_30) 
    (meets_preference isabella hour_11) 
    (meets_preference isabella hour_12) 
    (meets_preference isabella hour_12_30))
  (:goal 
    (exists (?t - start_time) (meeting_scheduled ?t))))