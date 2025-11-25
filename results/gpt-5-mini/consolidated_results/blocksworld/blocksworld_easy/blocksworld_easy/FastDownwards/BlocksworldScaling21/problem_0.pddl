(define (problem blocks-problem-01)
  (:domain blocks-single-handed)
  (:objects
    red blue orange yellow - block
    table - surface
  )
  (:init
    ;; initial locations
    (on orange yellow)
    (ontable red)
    (ontable blue)
    (ontable yellow)

    ;; hand / clear facts
    (clear red)
    (clear blue)
    (clear orange)
    (handempty)
  )
  ;; Goals: required final locations and empty hand as mandated terminal conditions.
  (:goal (and
    (on blue yellow)
    (on orange red)
    (ontable red)
    (ontable yellow)
    (handempty)
  ))
)