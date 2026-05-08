(define (problem MysteryBlocksworld16-problem)
  (:domain MysteryBlocksworld16)

  (:objects
    a b c d - obj

    p0 p1 p2 p3 p4 p5 p6 - phase
  )

  (:init
    ;; Initial craving relations (from the human specification)
    (craves a c)
    (craves b a)
    (craves d b)

    ;; initial global flags
    (harmony)

    ;; initial planetary/province assignments
    (planet c)
    (province d)

    ;; phase / temporal ordering: start at p0 and allow up to 6 actions
    (current-phase p0)
    (successor p0 p1)
    (successor p1 p2)
    (successor p2 p3)
    (successor p3 p4)
    (successor p4 p5)
    (successor p5 p6)
  )

  (:goal (and
    (craves b c)
    (craves c d)
  ))
)