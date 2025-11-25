(define (problem place-blue-on-orange)
  (:domain blocksworld-manipulator)
  (:objects
    blue orange red yellow - block
    table - place
    stage0 stage1 stage2 - stage
  )
  (:init
    (succ stage0 stage1)
    (succ stage1 stage2)
    (current stage0)
    (clear blue)
    (clear orange)
    (hand-empty)
    (on blue yellow)
    (on orange red)
    (on red table)
    (on yellow table)
  )
  (:goal (and
    (on blue orange)
    (current stage2)
  ))
)