(define (problem schedule_one_monday_meeting)
  (:domain meeting_scheduling)
  (:objects
    diana ethan janet - participant
    slot-10_00-10_30 slot-10_30-11_00 slot-11_00-11_30 - timeslot
  )
  (:init
    ;; before noon facts for the feasible morning slots
    (before_noon slot-10_00-10_30)
    (before_noon slot-10_30-11_00)
    (before_noon slot-11_00-11_30)

    ;; availability (free) facts consistent with audited joint candidate slots
    ;; Diana (busy 11:30-12:00 and 13:00-13:30 -> available for these morning slots)
    (free diana slot-10_00-10_30)
    (free diana slot-10_30-11_00)
    (free diana slot-11_00-11_30)

    ;; Ethan (no meetings -> available)
    (free ethan slot-10_00-10_30)
    (free ethan slot-10_30-11_00)
    (free ethan slot-11_00-11_30)

    ;; Janet (busy 09:00-10:00 and other afternoon slots; prefers before noon -> available for these morning slots)
    (free janet slot-10_00-10_30)
    (free janet slot-10_30-11_00)
    (free janet slot-11_00-11_30)
  )
  (:goal (meeting_scheduled))
)