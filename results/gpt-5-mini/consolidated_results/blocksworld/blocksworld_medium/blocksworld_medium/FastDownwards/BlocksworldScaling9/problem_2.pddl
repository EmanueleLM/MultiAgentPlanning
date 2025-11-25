(define (problem bw-orchestrated-problem-1)
  (:domain blocksworld-orchestrated)

  (:objects
    red blue orange yellow - block
    table - place
  )

  (:init
    (on red yellow)
    (on blue table)
    (on orange table)
    (on yellow table)

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