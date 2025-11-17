(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  (:objects
    brian billy patricia - person
    ts-12_30_13_00 ts-13_00_13_30 - timeslot
  )

  (:init
    ;; Audited candidate timeslots (from availability intersection and preference filtering).
    (candidate ts-12_30_13_00)
    (candidate ts-13_00_13_30)

    ;; Timeslots lie within Monday work hours 09:00-17:00.
    (work-slot ts-12_30_13_00)
    (work-slot ts-13_00_13_30)

    ;; Immediate successor relation between adjacent candidate slots (explicit ordering).
    (slot-next ts-12_30_13_00 ts-13_00_13_30)

    ;; Availability facts (audited):
    ;; Brian: no meetings the whole day -> free at both candidate slots.
    (free brian ts-12_30_13_00)
    (free brian ts-13_00_13_30)

    ;; Billy busy: 10:00-10:30, 11:30-12:00, 14:00-14:30, 16:30-17:00 -> free at these candidates.
    (free billy ts-12_30_13_00)
    (free billy ts-13_00_13_30)

    ;; Patricia busy: 09:00-12:30, 13:30-14:00, 14:30-16:00, 16:30-17:00 -> free at these candidates.
    (free patricia ts-12_30_13_00)
    (free patricia ts-13_00_13_30)

    ;; No meeting scheduled initially (meeting-scheduled is absent).
  )

  ;; Goal: exactly one meeting must be scheduled. The domain's negative precondition
  ;; prevents scheduling more than one meeting, so achieving meeting-scheduled is exact.
  (:goal (meeting-scheduled))
)