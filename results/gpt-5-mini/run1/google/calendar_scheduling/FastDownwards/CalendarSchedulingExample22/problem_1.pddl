(define (problem schedule-meeting-problem)
  (:domain scheduling)

  ;; Objects: half-hour slots from 09:00 to 16:30 (30-minute granularity).
  ;; s0=09:00, s1=09:30, s2=10:00, s3=10:30, s4=11:00, s5=11:30, s6=12:00,
  ;; s7=12:30, s8=13:00, s9=13:30, s10=14:00, s11=14:30, s12=15:00, s13=15:30, s14=16:00, s15=16:30
  (:objects
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ;; Successor chain
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)

    ;; Theresa's cleaned availabilities (30-min slot starts)
    ;; Theresa free slots: s1,s2,s3,s4,s5,s6 and s12,s13,s14
    (avail_theresa s1) (avail_theresa s2) (avail_theresa s3)
    (avail_theresa s4) (avail_theresa s5) (avail_theresa s6)
    (avail_theresa s12) (avail_theresa s13) (avail_theresa s14)

    ;; Charles's cleaned availabilities
    ;; Charles free slots: s0,s1,s3,s4,s7,s8,s9,s13,s14,s15
    (avail_charles s0) (avail_charles s1)
    (avail_charles s3) (avail_charles s4)
    (avail_charles s7) (avail_charles s8) (avail_charles s9)
    (avail_charles s13) (avail_charles s14) (avail_charles s15)

    ;; Betty's cleaned availabilities
    ;; Betty free slots: s3,s4,s5,s10,s11,s14,s15
    (avail_betty s3) (avail_betty s4) (avail_betty s5)
    (avail_betty s10) (avail_betty s11)
    (avail_betty s14) (avail_betty s15)
  )

  ;; Goal: schedule the single mandated 60-minute meeting.
  (:goal (meeting_scheduled))
)