(define (problem schedule-meeting-mon)
  (:domain meeting-scheduling)
  (:objects
    p1 p2 p3 p4 p5 p6 p7 - participant
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - timeslot
  )

  (:init
    (avail p1 s1) (avail p1 s4) (avail p1 s6)
    (avail p2 s0) (avail p2 s4) (avail p2 s7)
    (avail p3 s2) (avail p3 s4)
    (avail p4 s4) (avail p4 s5)
    (avail p5 s3) (avail p5 s4) (avail p5 s8)
    (avail p6 s4) (avail p6 s9)
    (avail p7 s4) (avail p7 s10)
  )

  (:goal (meeting-scheduled))
)