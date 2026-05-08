(define (problem conquest-problem)
  (:domain conquest)
  (:objects
    a b c d - agent
    p1 - province
    pl1 - planet
  )

  (:init
    ;; declarations of typed domain objects (explicit predicates as requested)
    (province p1)
    (planet pl1)
    (province-on p1 pl1)

    ;; initial locations: all relevant agents present in the one province so sequences can execute
    (located a p1)
    (located c p1)
    (located d p1)

    ;; initial control: c controls the province at start
    (controls c p1)

    ;; no harmony on pl1 (omitted harmony fact -> treated as false); Attack requires (not (harmony pl1))

    ;; explicit distinct facts to enforce different agents (prevent self-attack)
    (distinct a b) (distinct a c) (distinct a d)
    (distinct b a) (distinct b c) (distinct b d)
    (distinct c a) (distinct c b) (distinct c d)
    (distinct d a) (distinct d b) (distinct d c)
  )

  (:goal (and
    (craves a c)
    (craves d a)
  ))
)