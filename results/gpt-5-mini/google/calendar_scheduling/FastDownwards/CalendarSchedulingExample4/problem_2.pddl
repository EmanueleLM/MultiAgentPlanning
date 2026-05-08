(define (problem schedule-monday-30)
  (:domain meeting-scheduler)
  (:objects
    donna john billy - agent
    meeting1 - meeting
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ; Encoded blocking (busy intervals) from validated availabilities.
    ; Donna busy on Monday 14:00-14:30 (s11) and 15:30-16:00 (s14)
    (blocked donna s11)
    (blocked donna s14)

    ; John busy on Monday 11:00-11:30 (s5) and 16:30-17:00 (s16)
    (blocked john s5)
    (blocked john s16)

    ; Billy busy on Monday 09:00-10:00 (s1,s2), 10:30-14:00 (s4,s5,s6,s7,s8,s9,s10), 14:30-17:00 (s12,s13,s14,s15,s16)
    (blocked billy s1) (blocked billy s2)
    (blocked billy s4) (blocked billy s5) (blocked billy s6) (blocked billy s7) (blocked billy s8) (blocked billy s9) (blocked billy s10)
    (blocked billy s12) (blocked billy s13) (blocked billy s14) (blocked billy s15) (blocked billy s16)
  )

  ; Goal: meeting1 must be scheduled and occupy the slot that is free for all participants.
  ; Based on validated constraints, the feasible shared free slot is s3 (10:00-10:30).
  (:goal (and
    (meeting-scheduled meeting1)
    (meeting-at meeting1 s3)
  ))
)