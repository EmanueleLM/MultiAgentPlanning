(define (problem calendar-scheduling-problem)
  (:domain calendar-scheduling)
  (:objects
    Roy Kathryn Amy - person
    ts1 ts2 ts3 ts4 ts5 ts6 - time-slot
  )
  (:init
    (valid-slot ts6) ; a slot after 15:30
    (available Roy ts1)
    (available Roy ts2)
    (available Kathryn ts1)
    (available Kathryn ts2)
    (available Amy ts6)
    (available Roy ts6)
    (available Kathryn ts6)
  )
  (:goal (exists (?t - time-slot) 
    (meeting-scheduled ?t)))
)