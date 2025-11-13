(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)

  (:objects
    slot_14_30_15_00 slot_16_00_16_30 - slot
  )

  (:init
    ;; validated candidate slots (hard intersection of availabilities from the audit)
    (free-all slot_14_30_15_00)
    (free-all slot_16_00_16_30)

    ;; soft preference resolution applied by the auditor/orchestrator:
    ;; Amy would rather not meet after 15:30, so only the earliest candidate
    ;; that does not violate that soft preference is marked allowed.
    (allowed slot_14_30_15_00)
  )

  (:goal (meeting-scheduled))
)