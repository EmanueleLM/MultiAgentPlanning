(define (problem provinces-goal)
  (:domain provinces-plan)
  (:objects
    a b c d s1 s2 p1 p2 - object
  )

  (:init
    ;; Global state: start in Pain (so Overcome is initially usable).
    (pain)

    ;; Initial Province holders: a, c, d, plus two spare provinces s1 and s2
    (province a)
    (province c)
    (province d)
    (province s1)
    (province s2)

    ;; Two planets available for Attack actions
    (planet p1)
    (planet p2)

    ;; All explicit distinctness facts for pairs of objects (used to enforce "other" constraints).
    ;; We assert (different X Y) for every ordered pair of distinct objects.
    (different a b) (different a c) (different a d) (different a s1) (different a s2) (different a p1) (different a p2)
    (different b a) (different b c) (different b d) (different b s1) (different b s2) (different b p1) (different b p2)
    (different c a) (different c b) (different c d) (different c s1) (different c s2) (different c p1) (different c p2)
    (different d a) (different d b) (different d c) (different d s1) (different d s2) (different d p1) (different d p2)
    (different s1 a) (different s1 b) (different s1 c) (different s1 d) (different s1 s2) (different s1 p1) (different s1 p2)
    (different s2 a) (different s2 b) (different s2 c) (different s2 d) (different s2 s1) (different s2 p1) (different s2 p2)
    (different p1 a) (different p1 b) (different p1 c) (different p1 d) (different p1 s1) (different p1 s2) (different p1 p2)
    (different p2 a) (different p2 b) (different p2 c) (different p2 d) (different p2 s1) (different p2 s2) (different p2 p1)
  )

  ;; Goal requires the three specified Craves facts to be simultaneously true.
  (:goal (and
    (craves b d)
    (craves c a)
    (craves d c)
  ))
)