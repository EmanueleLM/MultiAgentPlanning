(define (problem bw-problem-1)
  (:domain blocksworld)
  ; Chosen scenario: no agent-provided scenario was available, so the example
  ; initial state/goal from Agent 1's prompt has been selected.
  (:objects A B C - block)

  (:init
    (on A B)
    (on B C)
    (on-table C)
    (clear A)
    (hand-empty)
  )

  (:goal (and
    (on B A)
  ))
)