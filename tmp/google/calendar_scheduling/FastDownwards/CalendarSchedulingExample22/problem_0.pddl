(define (problem integrated-schedule-monday)
  (:domain integrated-meeting)

  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - timeslot
  )

  (:init
    ;; next relationships (30-minute increments 09:00-09:30 ... 16:00-16:30)
    (next s09_00 s09_30) (next s09_30 s10_00) (next s10_00 s10_30) (next s10_30 s11_00)
    (next s11_00 s11_30) (next s11_30 s12_00) (next s12_00 s12_30) (next s12_30 s13_00)
    (next s13_00 s13_30) (next s13_30 s14_00) (next s14_00 s14_30) (next s14_30 s15_00)
    (next s15_00 s15_30) (next s15_30 s16_00) (next s16_00 s16_30)

    ;; agent1 expects an "adjacent" relation (map it same as next)
    (adjacent s09_00 s09_30) (adjacent s09_30 s10_00) (adjacent s10_00 s10_30) (adjacent s10_30 s11_00)
    (adjacent s11_00 s11_30) (adjacent s11_30 s12_00) (adjacent s12_00 s12_30) (adjacent s12_30 s13_00)
    (adjacent s13_00 s13_30) (adjacent s13_30 s14_00) (adjacent s14_00 s14_30) (adjacent s14_30 s15_00)
    (adjacent s15_00 s15_30) (adjacent s15_30 s16_00) (adjacent s16_00 s16_30)

    ;; Agent 1's known available slots (from their t0..t15 mapping)
    ;; t0 = s09_00, t7 = s12_30, t8 = s13_00, t10 = s14_00, t11 = s14_30, t15 = s16_30
    (a1_available s09_00)
    (a1_available s12_30) (a1_available s13_00)
    (a1_available s14_00) (a1_available s14_30)
    (a1_available s16_30)

    ;; Agent 2's known free slots (their "free" predicate)
    ;; s10_00; s11_30,s12_00; s14_00,s14_30,s15_00
    (a2_free s10_00)
    (a2_free s11_30) (a2_free s12_00)
    (a2_free s14_00) (a2_free s14_30) (a2_free s15_00)

    ;; Agent 3's known available slots (their "available" predicate)
    ;; 09:00,09:30,10:00 ; 12:00 ; 13:00,13:30 ; 15:00,15:30
    (a3_available s09_00) (a3_available s09_30) (a3_available s10_00)
    (a3_available s12_00)
    (a3_available s13_00) (a3_available s13_30)
    (a3_available s15_00) (a3_available s15_30)

    ;; Allow agent 3 to be flexible/able to reschedule (enables negotiation step)
    (flexible_a3)
  )

  (:goal (meeting-scheduled))
)