(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    donna john billy - participant
    slot_10_00 - timeslot
  )

  (:init
    (within-work slot_10_00)
    ;; No (busy ...) facts for slot_10_00 since auditor intersection shows all participants free at 10:00-10:30.
    ;; No successor facts are required because only the single 30-minute slot is being considered.
  )

  (:goal (scheduled slot_10_00))
)