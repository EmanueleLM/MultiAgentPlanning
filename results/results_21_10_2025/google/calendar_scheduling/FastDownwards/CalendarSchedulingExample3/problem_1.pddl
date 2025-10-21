(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  ;; Objects: the single candidate 60-minute start slot that fits all participants
  (:objects
    slot-monday-09:30 - slot
    arthur michael samantha - agent
  )

  ;; Initial facts:
  ;; Derived strictly from participants' calendars:
  ;; - Arthur: busy 09:00-09:30 and 10:30-12:00, so 09:30-10:30 is free.
  ;; - Michael: busy 13:00-13:30 and 14:00-14:30, so 09:30-10:30 is free.
  ;; - Samantha: busy 10:30-11:00 and 12:00-15:00 and 15:30-17:00, so 09:30-10:30 is free.
  ;; No other free slots are asserted.
  (:init
    (free-arthur slot-monday-09:30)
    (free-michael slot-monday-09:30)
    (free-samantha slot-monday-09:30)
  )

  ;; Goal: ensure a meeting is scheduled (the planner must pick a slot where all agents are free).
  (:goal
    (meeting-scheduled)
  )
)