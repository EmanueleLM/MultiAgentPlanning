(define (problem stack-red-on-orange-blue-on-red)
  (:domain block-stacking-collab)
  (:objects
    red blue orange yellow - block
    s1 s2 s3 s4 s5 - stage
  )
  (:init
    ;; initial stacking relations
    (on red orange)
    (on blue yellow)
    (ontable orange)
    (ontable yellow)

    ;; top blocks are clear (no block on top and not held)
    (clear red)
    (clear blue)

    ;; hand empty initially
    (handempty)

    ;; discrete linear stages (enforce one action per stage sequentially)
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