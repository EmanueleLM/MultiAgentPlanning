(define (problem meet-andrew-problem)
  (:domain meet-andrew)

  (:objects
    presidio union_square - location
    t540 t600 t630 t645 t653 t675 t780 - time
  )

  (:init
    (at presidio t540)
    (now t540)

    (reach60 t540 t600)
    (reach30 t600 t630)
    (reach15 t630 t645)
    (reach8  t645 t653)

    (reach22 t653 t675)

    (reach105 t675 t780)
  )

  (:goal (met-andrew))
)