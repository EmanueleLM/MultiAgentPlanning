(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    ;; initial craves relations
    (craves b a)
    (craves d b)
    ;; global harmony
    (harmony)
    ;; planets (static attributes provided in initial facts)
    (planet a)
    (planet c)
    ;; initial province tokens
    (province c)
    (province d)
    ;; time: start at s0; successor chain enforces discrete progression
    (current s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    ;; explicit distinctness facts for all unequal ordered pairs
    (distinct a b) (distinct a c) (distinct a d)
    (distinct b a) (distinct b c) (distinct b d)
    (distinct c a) (distinct c b) (distinct c d)
    (distinct d a) (distinct d b) (distinct d c)
  )
  (:goal (and (craves b d) (craves d c)))
)