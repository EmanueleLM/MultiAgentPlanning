(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)
  (:objects
    alexander elizabeth walter - person
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
    meeting1 - mtg
  )

  (:init
    ; Slot ordering (30-minute contiguous slots from 09:00 to 17:00)
    (next s1 s2) ; 09:00-09:30 -> 09:30-10:00
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
    (next s10 s11)
    (next s11 s12)
    (next s12 s13)
    (next s13 s14)
    (next s14 s15)
    (next s15 s16) ; 16:30-17:00

    ; Individual availability (free) derived from audited busy intervals:
    ; Alexander busy: 09:30-10:00 (s2), 10:30-11:00 (s4), 12:30-13:00 (s8), 14:30-15:00 (s12), 16:00-17:00 (s15,s16)
    ; -> free: s1, s3, s5, s6, s7, s9, s10, s11, s13, s14
    (free alexander s1) (free alexander s3) (free alexander s5) (free alexander s6)
    (free alexander s7) (free alexander s9) (free alexander s10) (free alexander s11)
    (free alexander s13) (free alexander s14)

    ; Elizabeth busy: 09:00-09:30 (s1), 11:30-12:30 (s6,s7), 13:00-14:30 (s9,s10,s11)
    ; -> free: s2, s3, s4, s5, s8, s12, s13, s14, s15, s16
    (free elizabeth s2) (free elizabeth s3) (free elizabeth s4) (free elizabeth s5)
    (free elizabeth s8) (free elizabeth s12) (free elizabeth s13) (free elizabeth s14)
    (free elizabeth s15) (free elizabeth s16)

    ; Walter busy: 09:00-14:30 (s1..s11), 15:30-17:00 (s14,s15,s16)
    ; -> free: s12, s13
    (free walter s12) (free walter s13)

    ; free-all facts: intersection of the above free sets yields only s13 (15:00-15:30)
    (free-all s13)
  )

  (:goal (and
    (scheduled meeting1)
  ))
)