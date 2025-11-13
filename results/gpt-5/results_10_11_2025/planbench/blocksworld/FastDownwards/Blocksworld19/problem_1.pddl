(define (problem case_b)
  (:domain blocksworld19)
  (:objects
    blue yellow red orange - block
  )
  (:init
    (handempty)
    (clear blue)
    (clear yellow)
    (on red orange)
    (on yellow red)
    (ontable blue)
    (ontable orange)
  )
  (:goal
    (and
      (on red orange)
      (on blue yellow)
      (on yellow red)
    )
  )
)