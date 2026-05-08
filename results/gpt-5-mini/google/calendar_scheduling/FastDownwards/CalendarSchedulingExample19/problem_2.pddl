(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)

  (:objects
    stephen edward angela - participant
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ;; temporal successor relations for 30-minute steps from 09:00..16:30
    (next s0 s1)  (next s1 s2)  (next s2 s3)  (next s3 s4)
    (next s4 s5)  (next s5 s6)  (next s6 s7)  (next s7 s8)
    (next s8 s9)  (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13)(next s13 s14)(next s14 s15)

    ;; free slots normalized to 30-minute resolution

    ;; stephen busy: s2, s8, s11, s14  -> free all other slots
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

  ;; Goal: schedule the 60-minute meeting (two consecutive half-hour slots).
  ;; Auditor-normalized intersection yields start at s5 (11:30) occupying s5 and s6 -> 11:30-12:30.
  (:goal (and
    (meeting_scheduled)
    (scheduled_at s5)
  ))
)