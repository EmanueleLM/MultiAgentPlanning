(define (problem blocks-problem)
  (:domain blocks)

  (:objects
    yellow blue orange red - block
  )

  (:init
    (on yellow blue)
    (on blue orange)
    (on orange red)
    (ontable red)
    (clear yellow)
    (handempty)
  )

  (:goal (and
    (on red blue)
    (on orange red)
    (on yellow orange)
    (handempty)
  ))
)