(define (problem blocksworld-hard-23)
  (:domain blocksworld)
  (:objects
    red - block
    blue - block
    orange - block
    yellow - block
  )
  (:init
    (clear yellow)
    (hand-empty)
    (on blue orange)
    (on orange red)
    (on yellow blue)
    (on-table red)
  )
  (:goal (and
    (on red blue)
    (on orange red)
    (on yellow orange)
    ; Blue must be on the table to support the stack, as nothing supports Blue.
    (on-table blue) 
  ))
)