(define (problem crave_problem)
  (:domain crave_domain)
  ;; Object universe explicitly enumerated as required.
  (:objects a b c d - obj)

  ;; Initial state: explicit positive facts only (absence implies false).
  ;; Initial facts provided by environment:
  ;; - Craves(b,d), Craves(c,b)
  ;; - Harmony true
  ;; - Planet(a), Planet(d)
  ;; - Province(a), Province(c)
  ;; Auditor requested explicit distinctness facts to enforce X != Y.
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

    ;; distinctness facts for all ordered pairs of different objects
    (different a b) (different a c) (different a d)
    (different b a) (different b c) (different b d)
    (different c a) (different c b) (different c d)
    (different d a) (different d b) (different d c)
  )

  ;; Global goal: a craves c AND b craves a (both must hold simultaneously).
  (:goal (and (craves a c) (craves b a)))
)