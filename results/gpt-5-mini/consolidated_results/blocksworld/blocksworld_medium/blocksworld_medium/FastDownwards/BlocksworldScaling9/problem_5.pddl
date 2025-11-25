(define (problem bw-orchestrated-problem-1)
  (:domain blocksworld-orchestrated)

  (:objects
    red blue orange yellow - block
  )

  (:init
    ;; factual placement
    (on red yellow)
    (ontable yellow)
    (ontable blue)
    (ontable orange)

    ;; clear/hand status consistent with placement:
    ;; red is on yellow so red is clear; yellow is not clear (no explicit predicate).
    (clear red)
    (clear blue)
    (clear orange)

    (handempty)
  )

  (:goal (and
    (on red blue)
    (on blue yellow)
  ))
)