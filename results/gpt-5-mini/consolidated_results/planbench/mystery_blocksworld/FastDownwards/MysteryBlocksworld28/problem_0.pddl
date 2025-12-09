(define (problem craving-problem)
  (:domain craving-domain)
  (:objects a b c d - obj)
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
    ;; explicit distinctness facts for all unequal ordered pairs (to allow
    ;; action preconditions that require distinct objects without using equality)
    (distinct a b) (distinct a c) (distinct a d)
    (distinct b a) (distinct b c) (distinct b d)
    (distinct c a) (distinct c b) (distinct c d)
    (distinct d a) (distinct d b) (distinct d c)
  )
  (:goal (and (craves b d) (craves d c)))
)