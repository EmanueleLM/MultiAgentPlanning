(define (problem schedule_one_monday_meeting)
  (:domain meeting_scheduling)
  (:objects
    diana ethan janet - participant
    slot-10_00-10_30 - timeslot
  )
  (:init
    ;; Single feasible, before-noon slot that is free for all participants.
    (before_noon slot-10_00-10_30)
    (free_for_all slot-10_00-10_30)
  )
  (:goal (meeting_scheduled))
)