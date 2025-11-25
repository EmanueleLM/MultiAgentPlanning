(define (problem place-blue-on-orange)
  (:domain blocksworld-manipulator)
  (:objects
    blue orange red yellow - block
    table - place
    stage0 stage1 stage2 - stage
  )
  (:init
    ;; stage ordering and current stage
    (succ stage0 stage1)
    (succ stage1 stage2)
    (current stage0)

    ;; hand and clearance facts (as reported)
    (clear blue)
    (clear orange)
    (hand-empty)

    ;; immediate supports
    (on blue yellow)
    (on orange red)

    ;; table placements
    (on red table)
    (on yellow table)
  )
  (:goal (and
    (on blue orange)
    (current stage2)
  ))
)