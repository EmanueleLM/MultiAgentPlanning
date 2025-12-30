(define (problem BlocksworldHardScaling16)
  (:domain blocksworld)
  (:objects
    blue - block
    red - block
    orange - block
    yellow - block
  )
  (:init
    (hand-empty)
    (on blue yellow)
    (on yellow red)
    (on red orange)
    (on-table orange)
    (clear blue)
  )
  (:goal (and
    (on blue yellow)
    (on orange red)
  ))
)