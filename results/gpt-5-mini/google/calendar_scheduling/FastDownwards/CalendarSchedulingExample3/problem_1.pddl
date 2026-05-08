(define (problem schedule-monday-1h)
  (:domain meeting-scheduling)
  (:objects
    arthur michael samantha - participant
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; Participant arthur: 09:30–10:30 -> s1,s2 ; 12:00–16:00 -> s6..s13
    (available arthur s1) (available arthur s2)
    (available arthur s6) (available arthur s7)
    (available arthur s8) (available arthur s9)
    (available arthur s10) (available arthur s11)
    (available arthur s12) (available arthur s13)

    ;; Participant michael: 09:00–13:00 -> s0..s7 ; 14:30–17:00 -> s11..s15
    (available michael s0) (available michael s1)
    (available michael s2) (available michael s3)
    (available michael s4) (available michael s5)
    (available michael s6) (available michael s7)
    (available michael s11) (available michael s12)
    (available michael s13) (available michael s14)
    (available michael s15)

    ;; Participant samantha: 09:00–10:30 -> s0,s1,s2 ; 11:00–12:00 -> s4,s5
    (available samantha s0) (available samantha s1) (available samantha s2)
    (available samantha s4) (available samantha s5)
  )

  (:goal (and
    (meeting-scheduled)
    (scheduled-at s1)
  ))
)