(define (problem bw-final-arrangement)
  (:domain blocks-world)
  (:objects A B F G - block table - table)

  (:init
    ;; initial arrangement
    (on G B)
    (on B table)
    (on F table)
    (on A table)

    ;; clear predicates for tops
    (clear G)
    (clear F)
    (clear A)

    (handempty)
  )

  (:goal (and
    (on G B)
    (on B A)
    (on A table)
    (on F table)
  ))
)