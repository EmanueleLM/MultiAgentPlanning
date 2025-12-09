(define (problem mystery-craving-problem)
  (:domain mystery-craving)
  (:objects
    a b c d - object
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )
  (:init
    ;; Initial crave relations
    (craves a c)
    (craves c b)
    (craves d a)

    ;; Initial status facts
    (harmony)
    (planet b)
    (province d)

    ;; Distinctness facts to encode "from another object" constraints as hard preconditions.
    (different a b) (different a c) (different a d)
    (different b a) (different b c) (different b d)
    (different c a) (different c b) (different c d)
    (different d a) (different d b) (different d c)

    ;; Initial stage: s0 is active. All actions must advance stage according to succ chain.
    (at-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
  )
  (:goal (and
    (craves a d)
    (craves d b)
  ))
)