(define (problem crave_problem)
  (:domain crave_domain)
  ;; Object universe explicitly enumerated.
  (:objects a b c d - obj
            s0 s1 s2 s3 s4 s5 s6 - stage)

  ;; Initial state: all positive facts explicitly listed.
  ;; Initial facts provided by environment:
  ;; - craves b d, craves c b
  ;; - harmony true
  ;; - planet a, planet d
  ;; - province a, province c
  ;; - current stage is s0 and successor chain provided.
  (:init
    ;; provinces
    (province a)
    (province c)

    ;; planets
    (planet a)
    (planet d)

    ;; initial cravings
    (craves b d)
    (craves c b)

    ;; harmony singleton
    (harmony)

    ;; stage facts: discrete sequence s0 -> s1 -> ... -> s6
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4) (stage s5) (stage s6)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6)
    (current s0)

    ;; distinctness facts for all ordered pairs of different objects
    (different a b) (different a c) (different a d)
    (different b a) (different b c) (different b d)
    (different c a) (different c b) (different c d)
    (different d a) (different d b) (different d c)
  )

  ;; Global goal: a craves c AND b craves a (must hold simultaneously).
  (:goal (and (craves a c) (craves b a)))
)