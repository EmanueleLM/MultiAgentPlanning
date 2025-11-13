(define (problem bw_problem_1)
  (:domain blocksworld)
  (:objects
    red blue yellow - block
  )
  (:init
    (on blue red)
    (ontable red)
    (ontable yellow)
    (clear blue)
    (clear yellow)
    (handempty)
  )
  (:goal (and
    (on red blue)
    (on blue yellow)
    (ontable yellow)
    (handempty)
  ))
)