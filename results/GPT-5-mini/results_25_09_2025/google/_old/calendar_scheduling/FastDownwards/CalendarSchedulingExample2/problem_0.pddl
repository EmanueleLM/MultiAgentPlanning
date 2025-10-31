(define (problem schedule-meeting-roy-kathryn-amy)
  (:domain multi-agent-meeting)

  (:objects
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30
    slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    ;; declare slot objects
    (slot slot_9_00) (slot slot_9_30) (slot slot_10_00) (slot slot_10_30)
    (slot slot_11_00) (slot slot_11_30) (slot slot_12_00) (slot slot_12_30)
    (slot slot_13_00) (slot slot_13_30) (slot slot_14_00) (slot slot_14_30)
    (slot slot_15_00) (slot slot_15_30) (slot slot_16_00) (slot slot_16_30)

    ;; Roy's (agent 1) availability:
    ;; Work hours 9:00–17:00 half-hour slots; known blocked: 9:00, 10:00, 11:00, 12:30
    ;; Mark all other slots free for Roy
    (free-roy slot_9_30) (free-roy slot_10_30) (free-roy slot_11_30)
    (free-roy slot_12_00) (free-roy slot_13_00) (free-roy slot_13_30)
    (free-roy slot_14_00) (free-roy slot_14_30) (free-roy slot_15_00)
    (free-roy slot_15_30) (free-roy slot_16_00) (free-roy slot_16_30)

    ;; Kathryn's (agent 2) availability:
    ;; Known busy: 9:30 and 16:30; all other slots considered available
    (free-kathryn slot_9_00) (free-kathryn slot_10_00) (free-kathryn slot_10_30)
    (free-kathryn slot_11_00) (free-kathryn slot_11_30) (free-kathryn slot_12_00)
    (free-kathryn slot_12_30) (free-kathryn slot_13_00) (free-kathryn slot_13_30)
    (free-kathryn slot_14_00) (free-kathryn slot_14_30) (free-kathryn slot_15_00)
    (free-kathryn slot_15_30) (free-kathryn slot_16_00)

    ;; Amy's (agent 3) availability and preference:
    ;; Blocked: 9:00–14:30, 15:00–16:00, 16:30–17:00 => free slots are 14:30 and 16:00
    (free-amy slot_14_30) (free-amy slot_16_00)
    (preferred-amy slot_14_30)
  )

  ;; Goal: find at least one slot where the meeting is confirmed by all three agents.
  (:goal (exists (?s - slot) (meeting-scheduled ?s)))
)