(define (problem build-tower-yellow-red-blue-orange)
  (:domain blocksworld-multiagent)
  (:objects
    worker1 worker2 - agent
    red blue orange yellow - block
  )

  (:init
    ;; Initial locations: all blocks on the table and clear
    (ontable red)
    (ontable blue)
    (ontable orange)
    (ontable yellow)

    (clear red)
    (clear blue)
    (clear orange)
    (clear yellow)

    ;; Agents start with empty hands
    (hand-empty worker1)
    (hand-empty worker2)
  )

  ;; Goal: create the explicit stacked order:
  ;; red on yellow, blue on red, orange on blue
  (:goal (and
    (on red yellow)
    (on blue red)
    (on orange blue)
  ))
)