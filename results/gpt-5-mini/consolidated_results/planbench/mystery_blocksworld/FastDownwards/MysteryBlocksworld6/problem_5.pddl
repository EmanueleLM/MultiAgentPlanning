(define (problem MysteryBlocksworld6-problem)
  (:domain cravings-domain)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )

  (:init
    ;; initial stated facts
    (craves b c)
    (harmony)
    (planet a)
    (planet c)
    (planet d)
    (province a)
    (province b)
    (province d)

    ;; explicit distinctness facts for all ordered pairs of distinct objects
    (different a b) (different a c) (different a d)
    (different b a) (different b c) (different b d)
    (different c a) (different c b) (different c d)
    (different d a) (different d b) (different d c)

    ;; stage ordering (succ links). Actions advance current along this chain.
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)
    (succ s9 s10)
    (succ s10 s11)
    (succ s11 s12)

    ;; initial current stage
    (current s0)
  )

  (:goal
    (and
      (craves a b)
      (craves b d)
      (craves d c)
    )
  )
)