(define (problem calendar-scheduling-problem)
  (:domain calendar-scheduling)
  (:objects
    Roy Kathryn Amy - person
    ts1 ts2 ts3 ts4 ts5 ts6 ts7 - time-slot
  )
  (:init
    (valid-slot ts3) ; 14:30 to 15:00
    (valid-slot ts5) ; 16:00 to 16:30
    (available Roy ts3)
    (available Roy ts5)
    (available Kathryn ts3)
    (available Kathryn ts5)
    (available Amy ts3)
    (order-timeslot ts3 ts5)
  )
  (:goal (exists (?t - time-slot) 
    (meeting-scheduled ?t)))
)