(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)

  (:objects
    roy kathryn amy - person
    slot_14_30_15_00 slot_16_00_16_30 - slot
  )

  (:init
    ;; persons and slots
    (person roy)
    (person kathryn)
    (person amy)
    (slot slot_14_30_15_00)
    (slot slot_16_00_16_30)

    ;; Validated candidate slots (intersection of all participants' free 30-min slots)
    ;; From the audit: both 14:30-15:00 and 16:00-16:30 are hard-available for Roy, Kathryn, Amy.
    (free-all slot_14_30_15_00)
    (free-all slot_16_00_16_30)

    ;; Soft preference resolution:
    ;; Amy would rather not meet after 15:30. The earliest candidate that does NOT violate that preference
    ;; is 14:30-15:00. We therefore mark only that slot as allowed so the planner selects it.
    (allowed slot_14_30_15_00)
    ;; note: slot_16_00_16_30 is a validated hard-candidate but violates Amy's soft preference and
    ;; is therefore not marked allowed.

    ;; No meeting scheduled initially.
    ;; (meeting-scheduled) is false by omission; negative precondition on the action enforces single scheduling.
  )

  (:goal (meeting-scheduled))
)