(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)

  (:objects
    roy kathryn amy - person

    slot_14_30_15_00 slot_16_00_16_30 - slot

    time_14_30 time_16_00 - time
  )

  (:init
    ;; persons
    (is-person roy)
    (is-person kathryn)
    (is-person amy)

    ;; slots and their start times
    (is-slot slot_14_30_15_00)
    (is-slot slot_16_00_16_30)

    (is-time time_14_30)
    (is-time time_16_00)

    (starts-at slot_14_30_15_00 time_14_30)
    (starts-at slot_16_00_16_30 time_16_00)

    ;; explicit ordering of the candidate time points (successor relation)
    (next-time time_14_30 time_16_00)

    ;; both candidate start times are within declared work hours (09:00-17:00)
    (within-work-hours time_14_30)
    (within-work-hours time_16_00)

    ;; validated candidate slots (hard intersection of availabilities from the audit)
    (free-all slot_14_30_15_00)
    (free-all slot_16_00_16_30)

    ;; soft preference resolution applied by the auditor/orchestrator:
    ;; Amy would rather not meet after 15:30, so only the earliest candidate
    ;; that does not violate that soft preference is marked allowed.
    (allowed slot_14_30_15_00)

    ;; No meeting is scheduled initially; meeting-scheduled omitted (false).
  )

  ;; Goal: meeting must be scheduled (one slot will become scheduled-at by the action).
  (:goal (meeting-scheduled))
)