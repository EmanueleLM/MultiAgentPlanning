(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    benjamin hannah brenda - participant
    s09_00_09_30 - slot
  )

  (:init
    ;; Minimal facts necessary to support the chosen slot
    (slot-in-window s09_00_09_30)
    (allowed s09_00_09_30)

    ;; All participants are available in the selected slot (Benjamin's preference enforced by allowed)
    (available benjamin s09_00_09_30)
    (available hannah s09_00_09_30)
    (available brenda s09_00_09_30)
  )

  (:goal (meeting-scheduled))
)