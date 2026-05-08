(define (problem bw-orchestrated-problem-1)
  (:domain blocksworld-orchestrated)

  (:objects
    red blue orange yellow - block
    table - place
  )

  (:init
    ;; Positions
    (on red yellow)
    (on blue table)
    (on orange table)
    (on yellow table)

    ;; Clear blocks (nothing on top of them)
    (clear red)
    (clear blue)
    (clear orange)
    ;; yellow is not clear because red is on it

    ;; Single manipulator is free
    (handempty)
  )

  (:goal (and
    (on red blue)
    (on blue yellow)
  ))
)