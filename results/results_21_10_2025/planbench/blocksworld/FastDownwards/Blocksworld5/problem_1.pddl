(define (problem Blocksworld5_A)
  (:domain blocksworld5)
  (:objects red orange blue yellow - block)
  (:init
    ; initial tower: blue on table, orange on blue, red on orange, yellow on red
    (ontable blue)
    (on orange blue)
    (on red orange)
    (on yellow red)

    ; clear/top and hand state
    (clear yellow)
    (handempty)
    ; Implicitly: red, orange, blue are not clear (not declared)
  )
  (:goal (and
    (on red blue)
    (on yellow orange)
  ))
)