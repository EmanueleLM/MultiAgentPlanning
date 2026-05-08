(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    donna john billy - participant
    slot_10_00 - timeslot
  )

  (:init
    ;; The auditor-provided intersection timeslot: 10:00-10:30 (inclusive-exclusive).
    (within-work slot_10_00)

    ;; All participants invited.
    (invited donna) (invited john) (invited billy)

    ;; No busy facts for slot_10_00 because it is free for all participants per audit.
    ;; (Other half-hour slots are not declared as objects and therefore cannot be used.)
  )

  ;; Goal: schedule the meeting at the earliest auditor-provided slot (slot_10_00).
  (:goal (scheduled slot_10_00))
)