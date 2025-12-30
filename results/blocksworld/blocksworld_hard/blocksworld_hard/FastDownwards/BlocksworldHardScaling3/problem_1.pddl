(define (problem BlocksworldHardScaling3)
  (:domain blocksworld)
  (:objects
    RED ORANGE YELLOW BLUE - block
  )
  (:init
    (on ORANGE YELLOW)
    (on YELLOW RED)
    (on-table RED)
    (on-table BLUE)
    (clear ORANGE)
    (clear BLUE)
    (hand-empty)
  )
  (:goal (and
    (on RED ORANGE)
    (on BLUE RED)
    (on YELLOW BLUE)
  ))
)