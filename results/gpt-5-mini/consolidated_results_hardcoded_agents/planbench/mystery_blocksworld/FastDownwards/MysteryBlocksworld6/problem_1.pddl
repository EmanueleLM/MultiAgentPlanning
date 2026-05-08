(define (problem MysteryBlocksworld6-problem)
  (:domain cravings-domain)
  (:objects a b c d - obj)

  (:init
    ;; Initial cravings and global harmony
    (craves b c)
    (harmony)

    ;; Initial planet facts
    (planet a)
    (planet c)
    (planet d)

    ;; Initial province facts
    (province a)
    (province b)
    (province d)
  )

  (:goal
    (and
      (craves a b)
      (craves b d)
      (craves d c)
    )
  )
)