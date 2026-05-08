(define (problem MysteryBlocksworld24)
  (:domain mystery-blocksworld)

  (:objects
    a b c d - obj
  )

  (:init
    ;; initial craving
    (craves c d)

    ;; initial global harmony
    (harmony)

    ;; planets present initially
    (planet a)
    (planet b)
    (planet d)

    ;; provinces present initially
    (province a)
    (province b)
    (province c)
  )

  (:goal (and
    (craves a b)
    (craves c a)
  ))
)