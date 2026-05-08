(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    theresa charles betty - participant
    m1 - meeting
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
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

    (busy theresa s1)
    (busy theresa s8)
    (busy theresa s9)
    (busy theresa s11)
    (busy theresa s12)
    (busy theresa s16)

    (busy charles s3)
    (busy charles s6)
    (busy charles s7)
    (busy charles s11)
    (busy charles s12)
    (busy charles s13)

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

  (:goal (not (unscheduled m1)))
)