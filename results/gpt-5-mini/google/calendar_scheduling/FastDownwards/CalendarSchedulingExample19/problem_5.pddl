(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)

  (:objects
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ; next relations for consecutive 30-min slots from 09:00 to 17:00
    (next s0 s1)  (next s1 s2)  (next s2 s3)  (next s3 s4)
    (next s4 s5)  (next s5 s6)  (next s6 s7)  (next s7 s8)
    (next s8 s9)  (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13)(next s13 s14)(next s14 s15)

    ; stephen busy: 10:00-10:30(s2), 13:00-13:30(s8), 14:30-15:00(s11), 16:00-16:30(s14)
    ; free all other slots for stephen
    (free stephen s0) (free stephen s1) (free stephen s3) (free stephen s4)
    (free stephen s5) (free stephen s6) (free stephen s7) (free stephen s9)
    (free stephen s10) (free stephen s12) (free stephen s13) (free stephen s15)

    ; edward busy: 09:00-09:30(s0), 10:00-10:30(s2), 13:30-14:30(s9,s10), 15:00-16:00(s12,s13)
    ; free all other slots for edward
    (free edward s1) (free edward s3) (free edward s4) (free edward s5)
    (free edward s6) (free edward s7) (free edward s8) (free edward s11)
    (free edward s14) (free edward s15)

    ; angela busy: 09:00-11:30(s0,s1,s2,s3,s4), 12:30-13:00(s7), 13:30-15:30(s9,s10,s11,s12), 16:00-17:00(s14,s15)
    ; free all other slots for angela
    (free angela s5) (free angela s6) (free angela s8) (free angela s13)
  )

  (:goal (and
    (meeting_scheduled)
  ))
)