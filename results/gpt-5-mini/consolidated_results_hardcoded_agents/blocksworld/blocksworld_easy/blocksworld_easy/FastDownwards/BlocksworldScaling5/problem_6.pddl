(define (problem place-blue-on-orange)
  (:domain blocksworld-manipulator)
  (:objects
    blue orange red yellow - block
    table - place
    stage0 stage1 stage2 - stage
  )
  (:init
    ;; explicit contiguous stage ordering and starting point
    (succ stage0 stage1)
    (succ stage1 stage2)
    (current stage0)

    ;; hand and clearance facts (consistent with "clear = no block on top and not held")
    (hand-empty)
    (clear blue)
    (clear orange)

    ;; stacking relations in the initial configuration
    (on blue yellow)
    (on orange red)
    (on red table)
    (on yellow table)

    ;; identify the table object
    (is-table table)
  )
  (:goal (and
    (on blue orange)
    (current stage2)
  ))
)