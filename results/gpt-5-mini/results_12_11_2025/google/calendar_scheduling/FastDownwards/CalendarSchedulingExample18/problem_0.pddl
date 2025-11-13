(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)
  (:objects
    brian billy patricia - person
    ts-12_30-13_00 ts-13_00-13_30 - timeslot
  )

  (:init
    ;; candidate slots (from audit: only the accepted candidates)
    (candidate ts-12_30-13_00)
    (candidate ts-13_00-13_30)

    ;; availability: all three participants are free at both accepted candidate slots
    ;; (per the audited valid_candidates and half-open interval semantics)
    (free brian ts-12_30-13_00)
    (free brian ts-13_00-13_30)

    (free billy ts-12_30-13_00)
    (free billy ts-13_00-13_30)

    (free patricia ts-12_30-13_00)
    (free patricia ts-13_00-13_30)

    ;; No meeting scheduled initially: meeting-scheduled is absent
    ;; No scheduled(...) facts initially
  )

  ;; Goal: exactly one meeting must be scheduled.
  ;; The domain action enforces at most one scheduling by requiring (not (meeting-scheduled))
  ;; as a precondition; achieving (meeting-scheduled) therefore means exactly one slot
  ;; will be scheduled (the schedule-meeting action also produces a scheduled ?t fact).
  (:goal (meeting-scheduled))
)