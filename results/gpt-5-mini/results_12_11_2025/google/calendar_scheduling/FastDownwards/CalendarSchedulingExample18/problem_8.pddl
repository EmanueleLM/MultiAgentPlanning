(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  (:objects
    brian billy patricia - person
    ts-12_30_13_00 ts-13_00_13_30 - timeslot
  )

  (:init
    ;; Audited candidate timeslots (only slots that satisfy availability and the stated preference).
    (candidate ts-12_30_13_00)
    (candidate ts-13_00_13_30)

    ;; Both candidate timeslots lie within the declared work hours 09:00-17:00.
    (work-slot ts-12_30_13_00)
    (work-slot ts-13_00_13_30)

    ;; Explicit immediate successor relation between adjacent candidate slots.
    (slot-next ts-12_30_13_00 ts-13_00_13_30)

    ;; Availability facts (audited intersection of calendars):
    ;; Brian: free at both candidate slots (no meetings whole day).
    (free brian ts-12_30_13_00)
    (free brian ts-13_00_13_30)

    ;; Billy: free at both candidate slots (busy at other times only; preference avoids after 15:30 enforced by candidate set).
    (free billy ts-12_30_13_00)
    (free billy ts-13_00_13_30)

    ;; Patricia: free at both candidate slots (busy earlier and later).
    (free patricia ts-12_30_13_00)
    (free patricia ts-13_00_13_30)
  )

  ;; Goal: exactly one meeting must be scheduled.
  ;; The action prevents scheduling more than one by requiring (not (meeting-scheduled)) as a precondition,
  ;; and the goal enforces that at least one meeting is scheduled.
  (:goal (meeting-scheduled))
)