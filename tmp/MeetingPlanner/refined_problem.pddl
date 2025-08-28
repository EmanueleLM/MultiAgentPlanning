(define (problem MeetingSchedule)
  (:domain MeetingScheduler)
  (:objects 
      visitor james - person
      Marina-District Alamo-Square - location
      time-09:00 time-09:15 time-15:45 time-17:00 time-20:00 - time
  )
  (:init 
      (at_location visitor Marina-District)
      (at_location james Alamo-Square)
      (can_meet visitor james)
      (current_time time-09:00)
      (available_time visitor time-20:00)
      (available_time james time-20:00)
  )
  (:goal 
    (and 
      (met visitor james)
    )
  )
)