(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    marie janice elijah theresa - participant
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:init
    (= (total-cost) 0)
    (free marie s1) (free marie s2) (free marie s3) (free marie s4)
    (free marie s6) (free marie s7) (free marie s8) (free marie s9)
    (free marie s10) (free marie s11) (free marie s12) (free marie s16)
    (free janice s1) (free janice s2) (free janice s3) (free janice s4)
    (free janice s5) (free janice s6) (free janice s7)
    (free janice s9) (free janice s13) (free janice s14) (free janice s15) (free janice s16)
    (free elijah s1) (free elijah s2)
    (free elijah s9) (free elijah s10) (free elijah s11)
    (free elijah s13) (free elijah s14) (free elijah s16)
    (free theresa s1) (free theresa s4) (free theresa s5) (free theresa s6)
  )
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)