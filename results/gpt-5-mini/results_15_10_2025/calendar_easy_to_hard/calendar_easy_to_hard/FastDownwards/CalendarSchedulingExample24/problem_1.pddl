(define (problem CalendarSchedulingExample24)
  (:domain meeting-scheduling)
  (:objects
    benjamin juan heather nathan jacob - person
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:init
    (person benjamin)
    (person juan)
    (person heather)
    (person nathan)
    (person jacob)

    (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7) (slot s8)
    (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15) (slot s16)

    ;; Benjamin free slots: 1,2,4,5,7,9,11,12,14,16
    (free benjamin s1) (free benjamin s2) (free benjamin s4) (free benjamin s5)
    (free benjamin s7) (free benjamin s9) (free benjamin s11) (free benjamin s12)
    (free benjamin s14) (free benjamin s16)

    ;; Juan free slots: 1,2,4,6,8,9,10,11,15,16
    (free juan s1) (free juan s2) (free juan s4) (free juan s6)
    (free juan s8) (free juan s9) (free juan s10) (free juan s11)
    (free juan s15) (free juan s16)

    ;; Heather free slots: 2,4,5,6,7,9,10,12,13,14,15,16
    (free heather s2) (free heather s4) (free heather s5) (free heather s6)
    (free heather s7) (free heather s9) (free heather s10) (free heather s12)
    (free heather s13) (free heather s14) (free heather s15) (free heather s16)

    ;; Nathan free slots: 5,8,9,10,12,15
    (free nathan s5) (free nathan s8) (free nathan s9)
    (free nathan s10) (free nathan s12) (free nathan s15)

    ;; Jacob free slots: 2,4,9,13
    (free jacob s2) (free jacob s4) (free jacob s9) (free jacob s13)
  )
  (:goal (and
    (chosen s9)
    (attended benjamin s9)
    (attended juan s9)
    (attended heather s9)
    (attended nathan s9)
    (attended jacob s9)
  ))
)