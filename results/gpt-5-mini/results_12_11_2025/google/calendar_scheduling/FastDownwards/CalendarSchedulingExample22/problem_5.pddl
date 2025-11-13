(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    theresa charles betty - participant
    m1 - meeting
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ;; ordered contiguous 30-minute slots from 09:00 to 17:00
    (next s1 s2)
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
    (next s15 s16)

    ;; Theresa busy: 09:00-09:30 (s1), 12:30-13:30 (s8,s9), 14:00-15:00 (s11,s12), 16:30-17:00 (s16)
    (busy theresa s1)
    (busy theresa s8)
    (busy theresa s9)
    (busy theresa s11)
    (busy theresa s12)
    (busy theresa s16)

    ;; Charles busy: 10:00-10:30 (s3), 11:30-12:30 (s6,s7), 14:00-15:30 (s11,s12,s13)
    (busy charles s3)
    (busy charles s6)
    (busy charles s7)
    (busy charles s11)
    (busy charles s12)
    (busy charles s13)

    ;; Betty busy: 09:00-10:30 (s1,s2,s3), 12:00-12:30 (s7), 13:00-14:00 (s9,s10), 15:00-16:00 (s13,s14)
    (busy betty s1)
    (busy betty s2)
    (busy betty s3)
    (busy betty s7)
    (busy betty s9)
    (busy betty s10)
    (busy betty s13)
    (busy betty s14)

    (unscheduled m1)
  )

  ;; The orchestrator selected the earliest feasible contiguous two-slot window:
  ;; s4 (10:30-11:00) and s5 (11:00-11:30) are free for all participants.
  (:goal (scheduled m1 s4 s5))
)