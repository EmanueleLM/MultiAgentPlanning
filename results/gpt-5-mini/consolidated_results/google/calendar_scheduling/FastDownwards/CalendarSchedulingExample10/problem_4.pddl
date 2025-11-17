(define (problem schedule_one_monday_meeting)
  (:domain meeting_scheduling)
  (:objects
    diana ethan janet - participant
    slot-10_00-10_30 slot-10_30-11_00 slot-11_00-11_30 - timeslot
  )
  (:init
    ;; Timeslot ordering (contiguous 30-minute granularity)
    (next slot-10_00-10_30 slot-10_30-11_00)
    (next slot-10_30-11_00 slot-11_00-11_30)

    ;; All three listed slots are before noon and are free for all three participants (audited feasible slots)
    (before_noon slot-10_00-10_30)
    (before_noon slot-10_30-11_00)
    (before_noon slot-11_00-11_30)

    (free_for_all slot-10_00-10_30)
    (free_for_all slot-10_30-11_00)
    (free_for_all slot-11_00-11_30)
  )
  (:goal (meeting_scheduled))
)