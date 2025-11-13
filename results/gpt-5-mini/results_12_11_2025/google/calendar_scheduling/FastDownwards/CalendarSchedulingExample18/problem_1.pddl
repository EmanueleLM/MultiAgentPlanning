(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  (:objects
    brian billy patricia - person
    ts-12_30_13_00 ts-13_00_13_30 - timeslot
  )

  (:init
    ;; Accepted candidate slots after intersecting availability and applying Billy's preference:
    (candidate ts-12_30_13_00)
    (candidate ts-13_00_13_30)

    ;; Availability facts (only for the audited, valid candidate slots).
    ;; Brian is free all day, so free at both candidates:
    (free brian ts-12_30_13_00)
    (free brian ts-13_00_13_30)

    ;; Billy is busy at 10:00-10:30, 11:30-12:00, 14:00-14:30, 16:30-17:00,
    ;; so he is free at these two candidate slots:
    (free billy ts-12_30_13_00)
    (free billy ts-13_00_13_30)

    ;; Patricia is busy 09:00-12:30, 13:30-14:00, 14:30-16:00, 16:30-17:00,
    ;; so she is free at 12:30-13:00 and 13:00-13:30:
    (free patricia ts-12_30_13_00)
    (free patricia ts-13_00_13_30)

    ;; No meeting scheduled initially (meeting-scheduled is absent).
  )

  ;; Goal: ensure exactly one meeting is scheduled.
  ;; The domain action enforces at most one meeting by requiring (not (meeting-scheduled))
  ;; as a precondition; achieving (meeting-scheduled) therefore results in a single scheduled slot.
  (:goal (meeting-scheduled))
)