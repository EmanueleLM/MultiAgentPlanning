(define (problem schedule-meeting-problem)
  (:domain schedule-domain)
  (:objects
    scott gabriel christine - participant
    t1230_1300 - timeslot
  )

  (:init
    ;; the auditor-selected intersection slot: 12:30-13:00 on Monday
    (within_work_hours t1230_1300)
    (available scott t1230_1300)
    (available gabriel t1230_1300)
    (available christine t1230_1300)
  )

  (:goal (and
    (scheduled t1230_1300)
  ))
)