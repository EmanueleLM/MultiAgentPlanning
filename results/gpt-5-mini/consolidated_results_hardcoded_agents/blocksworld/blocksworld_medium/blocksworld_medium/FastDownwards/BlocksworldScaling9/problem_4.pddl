(define (problem bw-orchestrated-problem-1)
  (:domain blocksworld-orchestrated)

  (:objects
    red blue orange yellow - block
  )

  (:init
    (on red yellow)
    (ontable yellow)
    (ontable blue)
    (ontable orange)

    (clear red)
    (clear blue)
    (clear orange)

    (handempty)
  )

  (:goal (and
    (on red blue)
    (on blue yellow)
  ))
)