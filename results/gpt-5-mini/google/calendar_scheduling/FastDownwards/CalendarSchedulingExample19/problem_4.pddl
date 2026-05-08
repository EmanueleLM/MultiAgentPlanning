(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)

  (:objects
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    (next s0 s1)  (next s1 s2)  (next s2 s3)  (next s3 s4)
    (next s4 s5)  (next s5 s6)  (next s6 s7)  (next s7 s8)
    (next s8 s9)  (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13)(next s13 s14)(next s14 s15)

    ;; stephen busy: s2, s8, s11, s14 -> free all other slots
    (free stephen s0) (free stephen s1) (free stephen s3) (free stephen s4)
    (free stephen s5) (free stephen s6) (free stephen s7) (free stephen s9)
    (free stephen s10) (free stephen s12) (free stephen s13) (free stephen s15)

    ;; edward busy: s0, s2, s9, s10, s12, s13 -> free others
    (free edward s1) (free edward s3) (free edward s4) (free edward s5)
    (free edward s6) (free edward s7) (free edward s8) (free edward s11)
    (free edward s14) (free edward s15)

    ;; angela busy: s0,s1,s2,s3,s4,s7,s9,s10,s11,s12,s14,s15 -> free others
    (free angela s5) (free angela s6) (free angela s8) (free angela s13)
  )

  (:goal (and
    (meeting_scheduled)
    (scheduled_at s5)
  ))
)