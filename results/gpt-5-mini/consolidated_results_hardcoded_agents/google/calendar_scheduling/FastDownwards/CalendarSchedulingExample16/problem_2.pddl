(define (problem schedule-meeting-problem)
  (:domain schedule-domain)
  (:objects
    scott gabriel christine - participant
    t1230_1300_mon - timeslot
  )
  (:init
    ;; timeslot is inside Monday work hours 09:00-17:00
    (within_work_hours t1230_1300_mon)
    ;; Availabilities for the selected 30-minute slot 12:30-13:00
    (available scott t1230_1300_mon)
    (available gabriel t1230_1300_mon)
    (available christine t1230_1300_mon)
  )
  (:goal (and
    (scheduled t1230_1300_mon)
  ))
)