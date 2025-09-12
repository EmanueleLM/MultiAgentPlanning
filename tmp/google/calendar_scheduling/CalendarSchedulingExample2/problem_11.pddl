(define (problem calendar-scheduling-problem)
  (:domain calendar-scheduling)
  (:objects
    Roy Kathryn Amy - person
    ts1 ts2 ts3 ts4 ts5 ts6 - time-slot
    ; Define times slots for half-hour intervals within the work hours
  )
  (:init
    ; Define availability based on private calendars
    (available Roy ts1)
    (available Roy ts2)
    ; Roy's blocked slots like ts3, ts4, ts5 should not be available
    (available Kathryn ts1)
    (available Kathryn ts2)
    ; Kathryn's blocked slots like ts6 should not be available
    (available Amy ts6)
    ; Amy's blocked slots before 15:30 like ts3, ts4, ts5 should not be available
    (available Roy ts6)
    (available Kathryn ts6)
    ; Ensure at least one slot like ts6, after 15:30, is available for Amy
  )
  (:goal (exists (?t - time-slot) 
    (and (meeting-scheduled ?t)
      (available Roy ?t)
      (available Kathryn ?t)
      (available Amy ?t)))
  )
)