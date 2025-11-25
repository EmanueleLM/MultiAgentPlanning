(define (problem bw-orchestrated-problem-1)
  (:domain blocksworld-orchestrated)

  (:objects
    red blue orange yellow - block
    time0 time1 time2 time3 time4 time5 time6 - time
  )

  (:init
    ;; placements
    (on red yellow)
    (ontable yellow)
    (ontable blue)
    (ontable orange)

    ;; clear facts consistent with placement
    (clear red)
    (clear blue)
    (clear orange)

    ;; single-hand initial state
    (handempty)

    ;; current time and strict successor chain (enforces contiguous time progression)
    (at time0)
    (succ time0 time1)
    (succ time1 time2)
    (succ time2 time3)
    (succ time3 time4)
    (succ time4 time5)
    (succ time5 time6)
  )

  (:goal (and
    (on red blue)
    (on blue yellow)
    (at time6)
  ))
)