(define (problem schedule_meeting_monday)
  (:domain jack_of_all_trades)

  (:objects
    janet rachel cynthia - person

    slot_9_00 slot_9_30 slot_10_00 slot_10_30
    slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    ;; next relations (30-minute increment chain)
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

    ;; meeting bookkeeping
    (meeting_not_scheduled)

    ;; Cynthia preference enforced as hard constraint: meeting must start at or after 13:30
    (allowed_start slot_13_30)
    (allowed_start slot_14_00)
    (allowed_start slot_14_30)
    (allowed_start slot_15_00)
    (allowed_start slot_15_30)
    (allowed_start slot_16_00)

    ;; Availability facts derived from given calendars (slots not blocked by busy intervals)

    ;; janet available slots (blocked: 09:30,10:00; 12:30; 14:00)
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

    ;; rachel available on every slot (no meetings)
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

    ;; cynthia available slots (blocked: 09:30; 11:00; 12:30-14:30; 16:00-17:00)
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