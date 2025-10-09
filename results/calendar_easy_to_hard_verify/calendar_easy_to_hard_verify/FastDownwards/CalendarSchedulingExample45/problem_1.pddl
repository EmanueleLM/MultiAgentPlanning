(define (problem CalendarSchedulingExample45-prob)
  (:domain calendar-scheduling)
  (:objects
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:init
    ; Emily available (busy s1,s5,s11,s16)
    (available emily s2) (available emily s3) (available emily s4)
    (available emily s6) (available emily s7) (available emily s8)
    (available emily s9) (available emily s10) (available emily s12)
    (available emily s13) (available emily s14) (available emily s15)

    ; Brian available (busy s2,s12,s13,s16)
    (available brian s1) (available brian s3) (available brian s4)
    (available brian s5) (available brian s6) (available brian s7)
    (available brian s8) (available brian s9) (available brian s10)
    (available brian s11) (available brian s14) (available brian s15)

    ; Gerald free entire day
    (available gerald s1) (available gerald s2) (available gerald s3) (available gerald s4)
    (available gerald s5) (available gerald s6) (available gerald s7) (available gerald s8)
    (available gerald s9) (available gerald s10) (available gerald s11) (available gerald s12)
    (available gerald s13) (available gerald s14) (available gerald s15) (available gerald s16)

    ; Julia free entire day
    (available julia s1) (available julia s2) (available julia s3) (available julia s4)
    (available julia s5) (available julia s6) (available julia s7) (available julia s8)
    (available julia s9) (available julia s10) (available julia s11) (available julia s12)
    (available julia s13) (available julia s14) (available julia s15) (available julia s16)

    ; Logan available (busy s1,s2,s5,s6,s7,s8,s9,s10,s15,s16)
    (available logan s3) (available logan s4) (available logan s11)
    (available logan s12) (available logan s13) (available logan s14)

    ; Judith available (busy s1,s2,s3,s4,s6,s7,s8,s13,s15,s16)
    (available judith s5) (available judith s9) (available judith s10)
    (available judith s11) (available judith s12) (available judith s14)

    ; Michael available (busy s1,s3,s4,s6,s7,s9,s10,s11,s12,s13,s15,s16)
    (available michael s2) (available michael s5) (available michael s8) (available michael s14)
  )
  (:goal (meeting-scheduled))
)