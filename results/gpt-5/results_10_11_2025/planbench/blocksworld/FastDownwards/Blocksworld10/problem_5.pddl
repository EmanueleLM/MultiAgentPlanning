(define (problem bw_problem_1)
  (:domain blocksworld)
  (:objects
    red blue yellow orange - block
  )
  (:init
    (on red yellow)
    (on blue orange)
    (ontable yellow)
    (ontable orange)
    (clear red)
    (clear blue)
    (handempty)
  )
  (:goal (and
    (on blue yellow)
    (on yellow red)
  ))
)