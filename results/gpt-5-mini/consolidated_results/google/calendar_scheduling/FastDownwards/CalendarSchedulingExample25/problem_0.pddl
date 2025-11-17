(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:objects
    Anthony Pamela Zachary - participant
    s_1330_1430 - slot
  )
  (:init
    ;; Participants and the audited recommended slot
    (participant Anthony) (participant Pamela) (participant Zachary)
    (slot s_1330_1430)

    ;; Availability facts encoding the audited recommendation:
    ;; All three participants are available for the unique recommended slot 13:30-14:30.
    (available Anthony s_1330_1430)
    (available Pamela s_1330_1430)
    (available Zachary s_1330_1430)
  )
  ;; Goal requires the solver to both choose the recommended slot and mark the meeting scheduled.
  (:goal (and (scheduled) (chosen s_1330_1430)))
)