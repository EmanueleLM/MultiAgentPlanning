(define (problem schedule_meeting_example)
  (:domain meeting_scheduling)
  (:objects 
    benjamin hannah brenda - participant
    time-slot-900 time-slot-930 time-slot-1000 time-slot-1030 
    time-slot-1100 time-slot-1130 time-slot-1200 time-slot-1230 
    time-slot-1300 time-slot-1330 time-slot-1400 time-slot-1430 
    time-slot-1500 time-slot-1530 time-slot-1600 time-slot-1630 - time_slot
  )
  
  (:init 
    (available benjamin time-slot-900)
    (available benjamin time-slot-930)
    (not (available benjamin time-slot-1000))
    (available hannah time-slot-900)
    (available hannah time-slot-930)
    (available hannah time-slot-1000)
    (available hannah time-slot-1030)
    (available brenda time-slot-900)
    (not (available brenda time-slot-930))
    (available brenda time-slot-1000)
    (available brenda time-slot-1030)
    
    (fits_meeting_duration time-slot-900 time-slot-930)
    (fits_meeting_duration time-slot-1000 time-slot-1030)

    (before time-slot-900 time-slot-930)
    (before time-slot-930 time-slot-1000)
    (before time-slot-1000 time-slot-1030)
    (before time-slot-1030 time-slot-1100)
    (before time-slot-1100 time-slot-1130)
    (before time-slot-1130 time-slot-1200)
    (before time-slot-1200 time-slot-1230)
    (before time-slot-1230 time-slot-1300)
    (before time-slot-1300 time-slot-1330)
    (before time-slot-1330 time-slot-1400)
    (before time-slot-1400 time-slot-1430)
    (before time-slot-1430 time-slot-1500)
    (before time-slot-1500 time-slot-1530)
    (before time-slot-1530 time-slot-1600)
    (before time-slot-1600 time-slot-1630)
  )
  
  (:goal 
    (exists (?t - time_slot) 
      (meeting_scheduled_at ?t)
    )
  )
)