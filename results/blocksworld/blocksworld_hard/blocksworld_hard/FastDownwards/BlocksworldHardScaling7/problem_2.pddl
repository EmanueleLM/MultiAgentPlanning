(define (problem blocksworld-instance)
  (:domain blocksworld)
  (:objects
    blue - block
    yellow - block
    red - block
    orange - block
  )
  (:init
    ; Initial Configuration based on human specification:
    ; Stack 1: Blue (top) -> Red -> Orange -> Table
    ; Stack 2: Yellow -> Table
    
    ; Placement
    (on blue red)
    (on red orange)
    (on-table orange)
    (on-table yellow)

    ; Clarity: blue block is clear, yellow block is clear.
    (clear blue)
    (clear yellow)
    ; Red and Orange are not clear because blocks are on top of them.

    ; Hand status
    (hand-empty)
  )
  (:goal (and
    ; Goal: Red on Blue, Blue on Yellow, Yellow on Orange, Orange on table.
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (on-table orange)
  ))
)