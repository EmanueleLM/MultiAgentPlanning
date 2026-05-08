(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    p_donna p_john p_billy - participant
    ts_10_00 - timeslot
  )

  (:init
    ;; The auditor-provided intersection contains exactly the following 30-minute slot.
    (within-work ts_10_00)

    ;; No (busy ...) facts for ts_10_00 are declared, meaning all participants are free at this slot.
    ;; All required temporal structure is represented explicitly by the timeslot object and within-work predicate.
  )

  (:goal (scheduled ts_10_00))
)