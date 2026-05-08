(define (problem build-tower-yellow-red-blue-orange)
  (:domain blocksworld-multiagent)
  (:objects
    worker1 worker2 - agent
    red blue orange yellow - block
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 - stage
  )

  (:init
    ;; Initial stacking: red on yellow, blue on orange; yellow and orange on the table
    (on red yellow)
    (on blue orange)
    (ontable yellow)
    (ontable orange)

    ;; Clearness: red and blue are clear (nothing on top). yellow and orange are not clear.
    (clear red)
    (clear blue)

    ;; Agents start with empty hands
    (hand-empty worker1)
    (hand-empty worker2)

    ;; Stage ordering (global stage token). The planner must advance the current-stage using next links.
    (current-stage stage0)
    (next stage0 stage1)
    (next stage1 stage2)
    (next stage2 stage3)
    (next stage3 stage4)
    (next stage4 stage5)
    (next stage5 stage6)
    (next stage6 stage7)
  )

  ;; Goal: create the explicit stacked order:
  ;; red on yellow, blue on red, orange on blue
  (:goal (and
    (on red yellow)
    (on blue red)
    (on orange blue)
  ))
)