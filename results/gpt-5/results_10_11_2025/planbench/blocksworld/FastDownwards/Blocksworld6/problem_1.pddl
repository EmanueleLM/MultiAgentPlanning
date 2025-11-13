(define (problem blocksworld6-s2)
  (:domain blocksworld-single-gripper)
  (:objects
    red blue yellow orange - block
  )
  (:init
    (clear red)
    (clear blue)
    (clear yellow)
    (handempty)
    (on blue orange)
    (ontable red)
    (ontable orange)
    (ontable yellow)
  )
  (:goal
    (and
      (on red blue)
      (on blue yellow)
      (on yellow orange)
    )
  )
)