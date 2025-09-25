(define (problem schedule-meeting-monday)
  (:domain schedule-meeting)
  (:objects
    heather nicholas zachary - person
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  ;; Initial state: meeting not yet scheduled, and per-person free/blocked slots.
  ;; Work hours: slots defined from 09:00 start to 16:30 start (30-min slots).
  ;; Heather private blocks: 09:00, 10:30, 13:00, 14:30, 16:00
  ;; Zachary private blocks: 09:00-10:30 (blocks 09:00,09:30,10:00),
  ;;                         11:00-12:00 (11:00,11:30),
  ;;                         12:30-13:00 (12:30),
  ;;                         13:30-16:30 (13:30,14:00,14:30,15:00,15:30,16:00)
  ;; Zachary preference: would rather not meet after 14:00 (marked as preferred slots before/at 14:00 when offered)
  (:init
    (meeting-unscheduled)

    ;; Nicholas: (no private blocks provided) free all slots
    (free nicholas s09_00) (free nicholas s09_30) (free nicholas s10_00) (free nicholas s10_30)
    (free nicholas s11_00) (free nicholas s11_30) (free nicholas s12_00) (free nicholas s12_30)
    (free nicholas s13_00) (free nicholas s13_30) (free nicholas s14_00) (free nicholas s14_30)
    (free nicholas s15_00) (free nicholas s15_30) (free nicholas s16_00) (free nicholas s16_30)

    ;; Heather: free except blocked at 09:00, 10:30, 13:00, 14:30, 16:00
    (free heather s09_30) (free heather s10_00)
    (free heather s11_00) (free heather s11_30)
    (free heather s12_00) (free heather s12_30)
    (free heather s13_30) (free heather s14_00)
    (free heather s15_00) (free heather s15_30)
    (free heather s16_30)

    ;; Zachary: free slots computed from his blocked ranges:
    ;; Free: s10_30, s12_00, s13_00, s16_30
    (free zachary s10_30) (free zachary s12_00) (free zachary s13_00) (free zachary s16_30)

    ;; Mark preferred slots (Zachary's preference "would rather not meet after 14:00").
    ;; These preferred marks are informational (planner may use them if preferences supported).
    (preferred s10_30) (preferred s12_00) (preferred s13_00)
  )

  ;; Goal: a meeting has been scheduled (at some slot). The three distinct schedule actions
  ;; will enforce that the chosen slot is free for all participants.
  (:goal (meeting-scheduled))
)