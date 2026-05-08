(define (problem blocksworld_scaling27-problem)
  (:domain blocksworld_scaling27)

  (:objects
    blue yellow orange red - block
  )

  (:init
    ;; Table placements and on-stack relations (initial stack: red <- orange <- yellow)
    (ontable red)
    (ontable blue)
    (on orange red)
    (on yellow orange)

    ;; Clear and hand state as specified
    (clear blue)
    (clear yellow)
    (handempty)
  )

  (:goal (and
    (on red orange)
    (on blue red)
  ))
)