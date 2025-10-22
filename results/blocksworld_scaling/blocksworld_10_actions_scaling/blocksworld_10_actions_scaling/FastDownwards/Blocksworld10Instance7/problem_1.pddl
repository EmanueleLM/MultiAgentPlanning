(define (problem Blocksworld10Instance7-final-check)
  (:domain blocks-world)
  (:objects A B C D E F G - block
            table - table)

  (:init
    ;; initial arrangement from the specification
    (on A E)
    (on E C)
    (on C D)
    (on D table)

    (on B table)
    (on G B)

    (on F table)

    ;; clear tops
    (clear A)
    (clear G)
    (clear F)

    (handempty)
  )

  (:goal (and
    ;; final arrangement derived from the executed actions
    (on D table)
    (on C D)
    (on E C)
    (on A E)
    (on B A)
    (on G B)
    (on F table)
  ))
)