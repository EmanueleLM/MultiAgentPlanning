(define (problem schedule_one_monday_meeting)
  (:domain meeting_scheduling)
  (:objects
    diana ethan janet - participant
    slot-10_00-10_30 slot-10_30-11_00 slot-11_00-11_30 - timeslot
  )
  (:init
    ;; before-noon markers for allowed slots
    (before_noon slot-10_00-10_30)
    (before_noon slot-10_30-11_00)
    (before_noon slot-11_00-11_30)

    ;; availability facts (all three participants free in these slots)
    (free diana slot-10_00-10_30)
    (free ethan slot-10_00-10_30)
    (free janet slot-10_00-10_30)

    (free diana slot-10_30-11_00)
    (free ethan slot-10_30-11_00)
    (free janet slot-10_30-11_00)

    (free diana slot-11_00-11_30)
    (free ethan slot-11_00-11_30)
    (free janet slot-11_00-11_30)
  )
  (:goal (meeting_scheduled))
)