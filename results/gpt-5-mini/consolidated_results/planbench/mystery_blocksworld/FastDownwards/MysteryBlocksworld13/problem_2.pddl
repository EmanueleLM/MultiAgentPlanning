(define (problem crave_problem)
  (:domain crave_domain)
  ;; Objects: four domain objects and a short stage chain sufficient for sequencing.
  (:objects a b c d - obj
            s0 s1 s2 s3 - stage)

  ;; Initial state trimmed to the minimal necessary facts:
  ;; - only positive facts provided by the environment (no full distinctness enumeration)
  ;; - 'same' facts only for equal pairs (n facts instead of n*(n-1))
  ;; - a short successor chain (3 links) rather than a longer chain.
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

    ;; stage successor chain and current stage
    (succ s0 s1) (succ s1 s2) (succ s2 s3)
    (current s0)

    ;; equal-pair facts only (used with negative preconditions to enforce distinctness)
    (same a a) (same b b) (same c c) (same d d)
  )

  ;; Global goal: a craves c AND b craves a (must hold simultaneously).
  (:goal (and (craves a c) (craves b a)))
)