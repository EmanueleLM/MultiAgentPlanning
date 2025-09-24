(define (problem schedule-joint-monday)
  (:domain orchestrator-scheduling)

  ;; Unified set of 30-min slots (09:00-17:00) and hour-starts (9..16)
  (:objects
    ;; 30-min slots (Arthur naming)
    s9_00 s9_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot

    ;; hour starts (Michael)
    t9 t10 t11 t12 t13 t14 t15 t16 - hour_start
  )

  (:init
    ;; Arthur's free 30-min slots (from participant 1)
    (free_a s9_30)
    (free_a s10_00)
    (free_a s12_00)
    (free_a s12_30)
    (free_a s13_00)
    (free_a s13_30)
    (free_a s14_00)
    (free_a s14_30)
    (free_a s15_00)
    (free_a s15_30)

    ;; Samantha's free 30-min slots (translated to the same slot names)
    ;; Samantha had free: 9:00-9:30, 9:30-10:00, 10:00-10:30, 11:00-11:30, 11:30-12:00, 15:00-15:30
    (free_s s9_00)
    (free_s s9_30)
    (free_s s10_00)
    (free_s s11_00)
    (free_s s11_30)
    (free_s s15_00)

    ;; Michael's free hour starts (from participant 2)
    (free_m t9)
    (free_m t10)
    (free_m t11)
    (free_m t12)
    (free_m t15)
    (free_m t16)

    ;; Succession relationships between 30-min slots (30-minute steps)
    (succ s9_00 s9_30)
    (succ s9_30 s10_00)
    (succ s10_00 s10_30)
    (succ s10_30 s11_00)
    (succ s11_00 s11_30)
    (succ s11_30 s12_00)
    (succ s12_00 s12_30)
    (succ s12_30 s13_00)
    (succ s13_00 s13_30)
    (succ s13_30 s14_00)
    (succ s14_00 s14_30)
    (succ s14_30 s15_00)
    (succ s15_00 s15_30)
    (succ s15_30 s16_00)
    (succ s16_00 s16_30)

    ;; Map hour starts to their two constituent 30-min slots (for schedule_on_hour)
    (hour_slots t9  s9_00  s9_30)
    (hour_slots t10 s10_00 s10_30)
    (hour_slots t11 s11_00 s11_30)
    (hour_slots t12 s12_00 s12_30)
    (hour_slots t13 s13_00 s13_30)
    (hour_slots t14 s14_00 s14_30)
    (hour_slots t15 s15_00 s15_30)
    (hour_slots t16 s16_00 s16_30)

    ;; Map half-hour start slots to the two hour_start entries they overlap (for schedule_on_half)
    ;; e.g., meeting starting at s9_30 (9:30-10:30) overlaps t9 (9:00-10:00) and t10 (10:00-11:00)
    (covers_half s9_30  t9  t10)
    (covers_half s10_30 t10 t11)
    (covers_half s11_30 t11 t12)
    (covers_half s12_30 t12 t13)
    (covers_half s13_30 t13 t14)
    (covers_half s14_30 t14 t15)
    (covers_half s15_30 t15 t16)
    (covers_half s16_30 t16 t16) ;; s16_30 would overlap t16 and beyond; we include a degenerate mapping t16/t16 to keep predicates well-formed

    ;; Note: busy slots from participants are simply not listed as free for that participant.
  )

  ;; Goal: schedule a 1-hour meeting that satisfies all three participants' constraints
  (:goal (meeting_scheduled))
)