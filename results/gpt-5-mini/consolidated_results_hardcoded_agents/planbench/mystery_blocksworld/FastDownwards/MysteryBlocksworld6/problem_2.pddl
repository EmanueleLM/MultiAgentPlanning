(define (problem MysteryBlocksworld6-problem)
  (:domain cravings-domain)
  (:objects a b c d - obj)

  (:init
    (craves b c)
    (harmony)
    (planet a)
    (planet d)
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