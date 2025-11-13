(define (problem schedule-meeting-problem)
  (:domain schedule-domain)
  (:objects
    scott gabriel christine - participant
    t1230_1300_mon - timeslot
  )
  (:init
    ;; timeslot t1230_1300_mon represents Monday 12:30-13:00 (one contiguous 30-minute slot)
    (within_work_hours t1230_1300_mon)
    (available scott t1230_1300_mon)
    (available gabriel t1230_1300_mon)
    (available christine t1230_1300_mon)
  )
  (:goal (and
    (scheduled t1230_1300_mon)
  ))
)