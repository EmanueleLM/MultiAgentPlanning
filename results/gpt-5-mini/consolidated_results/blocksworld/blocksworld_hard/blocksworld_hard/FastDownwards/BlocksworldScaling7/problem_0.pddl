(define (problem bw-problem)
  (:domain blocks)
  (:objects
    blue yellow red orange - block
  )

  (:init
    ; initial physical arrangement
    (on red orange)
    (on blue red)
    (ontable orange)
    (ontable yellow)

    ; bookkeeping atoms maintained by actions (consistent with initial arrangement)
    (clear blue)
    (clear yellow)
    (handempty)
  )

  ; Goal: form the tower red on blue on yellow on orange,
  ; and ensure orange remains on the table and the hand is empty at the end.
  (:goal (and
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (ontable orange)
    (handempty)
  ))
)