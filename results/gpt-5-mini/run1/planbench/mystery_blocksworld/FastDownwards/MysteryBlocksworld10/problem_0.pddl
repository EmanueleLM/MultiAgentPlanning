(define (problem harmony-problem)
  (:domain harmony-domain)
  (:objects
    a b c d - agent
    province_a province_b province_c - province
    planet_a planet_c planet_d - planet
  )

  (:init
    ;; Global harmony
    (harmony)

    ;; Initial ownerships inferred from ground facts (name-matching)
    (owns_province a province_a)
    (owns_province b province_b)
    (owns_province c province_c)

    (owns_planet a planet_a)
    (owns_planet c planet_c)
    (owns_planet d planet_d)

    ;; Initial cravings (from public facts)
    (craves b d)

    ;; Distinctness facts to enforce inequality constraints (explicit)
    (distinct a b) (distinct a c) (distinct a d)
    (distinct b a) (distinct b c) (distinct b d)
    (distinct c a) (distinct c b) (distinct c d)
    (distinct d a) (distinct d b) (distinct d c)
  )

  (:goal (and
    (craves b c)
    (craves d a)
  ))
)