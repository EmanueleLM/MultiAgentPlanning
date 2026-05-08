(define (problem schedule_meeting_monday)
  (:domain calendar_scheduling)

  (:objects
    janet rachel cynthia - person

    slot_9_00 slot_9_30 slot_10_00 slot_10_30
    slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    ;; adjacency of half-hour slots
    (next slot_9_00 slot_9_30)
    (next slot_9_30 slot_10_00)
    (next slot_10_00 slot_10_30)
    (next slot_10_30 slot_11_00)
    (next slot_11_00 slot_11_30)
    (next slot_11_30 slot_12_00)
    (next slot_12_00 slot_12_30)
    (next slot_12_30 slot_13_00)
    (next slot_13_00 slot_13_30)
    (next slot_13_30 slot_14_00)
    (next slot_14_00 slot_14_30)
    (next slot_14_30 slot_15_00)
    (next slot_15_00 slot_15_30)
    (next slot_15_30 slot_16_00)
    (next slot_16_00 slot_16_30)

    ;; meeting not yet scheduled
    (meeting_not_scheduled)

    ;; allowed start times (Cynthia prefers not before 13:30; encoded as allowed starts from 13:30)
    (allowed_start slot_13_30)
    (allowed_start slot_14_00)
    (allowed_start slot_14_30)
    (allowed_start slot_15_00)
    (allowed_start slot_15_30)
    (allowed_start slot_16_00)

    ;; availabilities derived from the given busy intervals
    ;; Janet busy: 9:30-10:30 (slot_9_30, slot_10_00), 12:30-13:00 (slot_12_30), 14:00-14:30 (slot_14_00)
    (available janet slot_9_00)
    (available janet slot_10_30)
    (available janet slot_11_00)
    (available janet slot_11_30)
    (available janet slot_12_00)
    (available janet slot_13_00)
    (available janet slot_13_30)
    (available janet slot_14_30)
    (available janet slot_15_00)
    (available janet slot_15_30)
    (available janet slot_16_00)
    (available janet slot_16_30)

    ;; Rachel has no meetings: available all slots
    (available rachel slot_9_00)
    (available rachel slot_9_30)
    (available rachel slot_10_00)
    (available rachel slot_10_30)
    (available rachel slot_11_00)
    (available rachel slot_11_30)
    (available rachel slot_12_00)
    (available rachel slot_12_30)
    (available rachel slot_13_00)
    (available rachel slot_13_30)
    (available rachel slot_14_00)
    (available rachel slot_14_30)
    (available rachel slot_15_00)
    (available rachel slot_15_30)
    (available rachel slot_16_00)
    (available rachel slot_16_30)

    ;; Cynthia busy: 9:30-10:00 (slot_9_30), 11:00-11:30 (slot_11_00),
    ;; 12:30-14:30 (slot_12_30, slot_13_00, slot_13_30, slot_14_00), 16:00-17:00 (slot_16_00, slot_16_30)
    (available cynthia slot_9_00)
    (available cynthia slot_10_00)
    (available cynthia slot_10_30)
    (available cynthia slot_11_30)
    (available cynthia slot_12_00)
    (available cynthia slot_14_30)
    (available cynthia slot_15_00)
    (available cynthia slot_15_30)
  )

  (:goal (and
    (meeting_scheduled)
  ))
)