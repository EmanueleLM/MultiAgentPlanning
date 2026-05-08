(define (problem orchestrated-problem)
  (:domain orchestrated-domain)

  (:objects
    object_a object_b object_c object_d - object
    province_a province_b province_c - province
    planet_a planet_c planet_d - planet
  )

  (:init
    ;; Existential facts for provinces and planets (from provided data)
    (exists-province province_a)
    (exists-province province_b)
    (exists-province province_c)

    (exists-planet planet_a)
    (exists-planet planet_c)
    (exists-planet planet_d)

    ;; Province-to-planet mappings (explicit, chosen consistent mappings using provided planets)
    ;; Note: mappings use only planets that were listed in the public info.
    (province-on province_a planet_a)
    (province-on province_b planet_d)
    (province-on province_c planet_c)

    ;; Initial controllers for provinces (explicit assignment)
    (controls object_a province_a)
    (controls object_b province_b)
    (controls object_c province_c)
    ;; object_d initially controls no province

    ;; Initial global harmony
    (harmony)

    ;; Initial craving fact (given)
    (craves object_b object_d)
  )

  (:goal (and
    (craves object_b object_c)
    (craves object_d object_a)
  ))
)