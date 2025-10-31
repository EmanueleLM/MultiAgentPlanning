(define (problem blocksworld14-problem-agent1)
  (:domain blocksworld14)

  ;; Chosen scenario: Agent 1's initial state and goal (agent1 provided full plan).
  (:objects
    red orange blue yellow - block
  )

  (:init
    ;; stacking relations: orange on blue, blue on yellow
    (on orange blue)
    (on blue yellow)

    ;; which blocks are directly on the table
    (on-table red)
    (on-table yellow)

    ;; clear facts provided by agent1
    (clear orange)
    (clear red)

    ;; hand initially empty
    (hand-empty)
  )

  ;; Goal: red on orange and blue on red (this is the goal the provided plan was intended to achieve)
  (:goal (and
    (on red orange)
    (on blue red)
  ))
)