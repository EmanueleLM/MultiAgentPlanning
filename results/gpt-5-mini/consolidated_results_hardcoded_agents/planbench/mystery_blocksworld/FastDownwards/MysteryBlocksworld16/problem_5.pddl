(define (problem MysteryBlocksworld16-problem)
  (:domain MysteryBlocksworld16)

  (:objects
    a b c d - obj

    p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 - phase
  )

  (:init
    ;; initial craving relations
    (craves a c)
    (craves b a)
    (craves d b)

    ;; initial global flags
    (harmony)

    ;; initial planetary/province assignments
    (planet c)
    (province d)

    ;; phase / temporal ordering: start at p0 and allow a bounded number of actions
    (current-phase p0)
    (successor p0 p1)
    (successor p1 p2)
    (successor p2 p3)
    (successor p3 p4)
    (successor p4 p5)
    (successor p5 p6)
    (successor p6 p7)
    (successor p7 p8)
    (successor p8 p9)
    (successor p9 p10)
    (successor p10 p11)
    (successor p11 p12)
    (successor p12 p13)
    (successor p13 p14)
    (successor p14 p15)
    (successor p15 p16)
    (successor p16 p17)
    (successor p17 p18)
    (successor p18 p19)
    (successor p19 p20)
    (successor p20 p21)
    (successor p21 p22)
    (successor p22 p23)
  )

  (:goal (and
    (craves b c)
    (craves c d)
  ))
)