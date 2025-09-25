(define (problem orchestrate-meeting)
  (:domain orchestrated-scheduling)

  (:objects
    michelle steven jerry - person
    m1 - meeting
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    (duration-60 m1)

    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; Michelle is busy 11:00-12:00 -> s4 (11:00-11:30) and s5 (11:30-12:00) are not free
    (free michelle s0) (free michelle s1) (free michelle s2) (free michelle s3)
    (free michelle s6) (free michelle s7) (free michelle s8) (free michelle s9)
    (free michelle s10) (free michelle s11) (free michelle s12) (free michelle s13)
    (free michelle s14) (free michelle s15)

    ;; Steven is blocked at 9:00-9:30 (s0), 11:30-12:00 (s5), 13:30-14:00 (s9), 15:30-16:00 (s13)
    (free steven s1) (free steven s2) (free steven s3) (free steven s4)
    (free steven s6) (free steven s7) (free steven s8)
    (free steven s10) (free steven s11) (free steven s12)
    (free steven s14) (free steven s15)

    ;; Jerry is blocked at 9:00-9:30 (s0), 10:00-11:00 (s2,s3), 11:30-12:30 (s5,s6),
    ;; 13:00-14:30 (s8,s9,s10), 15:30-16:00 (s13), 16:30-17:00 (s15)
    (free jerry s1) (free jerry s4) (free jerry s7) (free jerry s11) (free jerry s12) (free jerry s14)
  )

  (:goal (meeting-finalized m1))
)