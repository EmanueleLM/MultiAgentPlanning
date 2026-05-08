(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:objects
    anthony pamela zachary - participant
    s_1330_1430 - slot
  )
  (:init
    ;; Only the essential availability facts for the audited recommended slot
    (available anthony s_1330_1430)
    (available pamela s_1330_1430)
    (available zachary s_1330_1430)
  )
  (:goal (scheduled))
)