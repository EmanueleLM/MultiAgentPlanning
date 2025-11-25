(define (problem blocks-task)
  (:domain blocks-world)
  (:objects red yellow blue orange - block)

  (:init
    ;; initial configuration per specification:
    (on red blue)
    (on blue orange)
    (ontable orange)
    (ontable yellow)
    (clear red)
    (clear yellow)
    (handempty)
  )

  (:goal (and
    (on blue orange)
    (on yellow blue)
  ))
)