(define (problem orchestrator-blocks-prob)
  (:domain orchestrator-blocks)
  (:objects
    a1 - agent
    orange red yellow blue - block
  )

  (:init
    ; single agent's hand is empty (single-hand constraint)
    (hand-empty a1)

    ; initial arrangement: all blocks start on the table and are clear
    (on-table orange)
    (on-table red)
    (on-table yellow)
    (on-table blue)

    (clear orange)
    (clear red)
    (clear yellow)
    (clear blue)
  )

  (:goal (and
    (on orange red)
    (on yellow blue)
  ))
)