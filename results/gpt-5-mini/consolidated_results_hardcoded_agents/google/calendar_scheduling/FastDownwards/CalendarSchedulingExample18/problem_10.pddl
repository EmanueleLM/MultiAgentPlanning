(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  (:objects
    brian billy patricia - person
    ts-12_30_13_00 ts-13_00_13_30 - timeslot
  )

  (:init
    ;; Audited valid candidate slots (aligned to 30-minute granularity).
    (candidate ts-12_30_13_00)
    (candidate ts-13_00_13_30)

    ;; Explicitly mark these timeslots as within the work hours 09:00-17:00.
    (work-slot ts-12_30_13_00)
    (work-slot ts-13_00_13_30)

    ;; Discrete time progression between the two adjacent slots.
    (slot-next ts-12_30_13_00 ts-13_00_13_30)

    ;; Free facts derived from intersecting individual calendars (only listed slots are free).
    ;; Brian has no meetings all day -> free on both listed slots.
    (free brian ts-12_30_13_00)
    (free brian ts-13_00_13_30)

    ;; Billy busy at 10:00-10:30,11:30-12:00,14:00-14:30,16:30-17:00 -> free at these slots.
    (free billy ts-12_30_13_00)
    (free billy ts-13_00_13_30)

    ;; Patricia busy 09:00-12:30,13:30-14:00,14:30-16:00,16:30-17:00 -> free at these slots.
    (free patricia ts-12_30_13_00)
    (free patricia ts-13_00_13_30)
  )

  ;; Goal: exactly one meeting must be scheduled (enforced by the domain's negative precondition).
  (:goal (meeting-scheduled))
)