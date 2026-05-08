(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  (:objects
    brian billy patricia - person
    ts-12_30_13_00 ts-13_00_13_30 - timeslot
  )

  (:init
    ;; Candidate timeslots (all are within work hours 09:00-17:00 and align to 30-min granularity).
    (candidate ts-12_30_13_00)
    (candidate ts-13_00_13_30)

    ;; Explicitly mark these timeslots as within work hours.
    (work-slot ts-12_30_13_00)
    (work-slot ts-13_00_13_30)

    ;; Discrete successor relation between adjacent slots (explicit time ordering).
    (slot-next ts-12_30_13_00 ts-13_00_13_30)

    ;; Availability facts (audited valid free facts for the participants at candidate slots).
    ;; Brian: free all day -> free at both candidates.
    (free brian ts-12_30_13_00)
    (free brian ts-13_00_13_30)

    ;; Billy: busy 10:00-10:30, 11:30-12:00, 14:00-14:30, 16:30-17:00 -> free at these candidates.
    (free billy ts-12_30_13_00)
    (free billy ts-13_00_13_30)

    ;; Patricia: busy 09:00-12:30, 13:30-14:00, 14:30-16:00, 16:30-17:00 -> free at these candidates.
    (free patricia ts-12_30_13_00)
    (free patricia ts-13_00_13_30)

    ;; No meeting scheduled initially (meeting-scheduled absent).
  )

  ;; Goal: ensure exactly one meeting is scheduled (the domain enforces at most one via negative precondition).
  (:goal (meeting-scheduled))
)