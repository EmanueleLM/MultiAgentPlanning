(define (problem orchestrated-meeting-monday)
  (:domain orchestrated-multiagent-scheduling)
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    (meeting-not-scheduled)

    (p1-available s09_00) (p1-available s09_30) (p1-available s10_00) (p1-available s10_30)
    (p1-available s11_00) (p1-available s11_30) (p1-available s12_00) (p1-available s12_30)
    (p1-available s13_00) (p1-available s13_30) (p1-available s14_00) (p1-available s15_00)
    (p1-available s16_00) (p1-available s16_30)
    (p1-busy s14_30) (p1-busy s15_30)

    (p2-available s09_00) (p2-available s09_30) (p2-available s10_00) (p2-available s10_30)
    (p2-available s11_00) (p2-available s11_30) (p2-available s12_00) (p2-available s12_30)
    (p2-available s13_00) (p2-available s13_30) (p2-available s14_00) (p2-available s14_30)
    (p2-available s15_00) (p2-available s15_30) (p2-available s16_00) (p2-available s16_30)

    (p3-available s09_00) (p3-available s09_30) (p3-available s10_00) (p3-available s10_30)
    (p3-available s11_00) (p3-available s11_30) (p3-available s12_00) (p3-available s12_30)
    (p3-available s13_00) (p3-available s13_30) (p3-available s14_00) (p3-available s14_30)
    (p3-available s15_00) (p3-available s15_30) (p3-available s16_00) (p3-available s16_30)

    (p4-available s09_00) (p4-available s09_30) (p4-available s10_00) (p4-available s10_30)
    (p4-available s11_00) (p4-available s11_30) (p4-available s12_00) (p4-available s12_30)
    (p4-available s13_00) (p4-available s13_30) (p4-available s14_00) (p4-available s14_30)
    (p4-available s15_00) (p4-available s15_30) (p4-available s16_00) (p4-available s16_30)

    (p5-available s10_00) (p5-available s11_30) (p5-available s13_00) (p5-available s14_30)
    (p5-available s15_00) (p5-available s15_30)
    (p5-busy s09_00) (p5-busy s09_30) (p5-busy s10_30) (p5-busy s11_00)
    (p5-busy s12_00) (p5-busy s12_30) (p5-busy s13_30) (p5-busy s14_00)
    (p5-busy s16_00) (p5-busy s16_30)

    (p6-available s12_00) (p6-available s12_30) (p6-available s13_00) (p6-available s13_30)
    (p6-available s14_30) (p6-available s15_00) (p6-available s16_00) (p6-available s16_30)
    (p6-busy s09_00) (p6-busy s09_30) (p6-busy s10_00) (p6-busy s10_30)
    (p6-busy s11_00) (p6-busy s11_30) (p6-busy s14_00) (p6-busy s15_30)

    (p7-available s10_30) (p7-available s11_00) (p7-available s13_00) (p7-available s14_00)
    (p7-busy s09_00) (p7-busy s09_30) (p7-busy s10_00) (p7-busy s11_30)
    (p7-busy s12_00) (p7-busy s12_30) (p7-busy s13_30) (p7-busy s14_30)
    (p7-busy s15_00) (p7-busy s15_30) (p7-busy s16_00) (p7-busy s16_30)
  )
  (:goal (meeting-found))
)