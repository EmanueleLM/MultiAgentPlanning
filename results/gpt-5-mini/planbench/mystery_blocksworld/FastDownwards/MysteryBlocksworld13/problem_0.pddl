(define (problem craving-goal)
  (:domain craving-economy)
  (:objects
    a b c d - object
  )

  ; Initial state exactly as provided in the environment public information,
  ; translated to parameterized fluents:
  ; - object b craves object d  => (craves b d)
  ; - object c craves object b  => (craves c b)
  ; - Harmony true              => (harmony)
  ; - Planet object a true      => (planet a)
  ; - Planet object d true      => (planet d)
  ; - Province object a true    => (province a)
  ; - Province object c true    => (province c)
  ; No Pain facts initially.

  ; Additional explicit assumptions required by the assembled model (enumerated here and encoded
  ; below as facts):
  ; - All object identities are distinct; provide (different ...) facts for every ordered pair of distinct objects.
  ; - Succumb and Overcome are allowed whenever their preconditions are met (no additional authorization predicates).
  ; - The only producers/consumers of Harmony, Province, and Planet are the defined actions and the initial state.

  (:init
    ; initial token and relation facts
    (craves b d)
    (craves c b)
    (harmony)
    (planet a)
    (planet d)
    (province a)
    (province c)

    ; explicit inequality facts (different) to enforce actor != other in binary actions
    (different a b) (different a c) (different a d)
    (different b a) (different b c) (different b d)
    (different c a) (different c b) (different c d)
    (different d a) (different d b) (different d c)
  )

  ; Goal: object a craves object c and object b craves object a
  (:goal (and
    (craves a c)
    (craves b a)
  ))
)