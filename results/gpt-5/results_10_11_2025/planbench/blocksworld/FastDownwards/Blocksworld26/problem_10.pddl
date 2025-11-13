(define (problem Blocksworld26-S1)
  (:domain Blocksworld26)
  (:objects blue orange red yellow - block)
  (:init
    (clear blue)
    (clear orange)
    (handempty)
    (on blue yellow)
    (on orange red)
    (ontable red)
    (ontable yellow)
  )
  (:goal
    (and
      (on red orange)
      (on yellow red)
    )
  )
)