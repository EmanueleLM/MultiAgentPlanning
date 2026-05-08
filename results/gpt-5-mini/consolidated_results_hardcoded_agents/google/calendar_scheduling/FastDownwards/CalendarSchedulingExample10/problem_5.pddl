(define (problem schedule_one_monday_meeting)
  (:domain meeting_scheduling)
  (:objects
    slot-10_00-10_30 - timeslot
  )
  (:init
    (before_noon slot-10_00-10_30)
    (free_for_all slot-10_00-10_30)
  )
  (:goal (meeting_scheduled))
)