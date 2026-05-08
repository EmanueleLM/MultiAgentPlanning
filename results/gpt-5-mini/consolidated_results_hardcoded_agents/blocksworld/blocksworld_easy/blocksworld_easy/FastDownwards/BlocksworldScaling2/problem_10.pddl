(define (problem stack-red-on-orange-blue-on-red)
  (:domain block-stacking-collab)
  (:objects
    red blue orange yellow - block
    s1 s2 s3 s4 s5 - stage
  )
  (:init
    ;; spatial initial state
    (on red orange)
    (on blue yellow)
    (ontable orange)
    (ontable yellow)

    ;; clear facts consistent with above: red and blue have nothing on top
    (clear red)
    (clear blue)

    ;; no block is held initially
    (handempty)

    ;; stage ordering and initial current stage
    (current s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
  )
  (:goal (and
    (on red orange)
    (on blue red)
  ))
)