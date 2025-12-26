(define (problem BlocksworldEasyScaling2-p1)
  (:domain BlocksworldEasyScaling2)
  (:objects
    red blue orange yellow - block
  )
  (:init
    (clear red)
    (clear blue)
    (handempty)
    (on red orange)
    (on blue yellow)
    (ontable orange)
    (ontable yellow)
    ; Note: (clear orange) and (clear yellow) are false implicitly
  )
  (:goal (and
    (on red orange)
    (on blue red)
  ))
)