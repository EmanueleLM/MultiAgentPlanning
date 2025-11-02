(define (problem blocks-observer1)
  (:domain blocks-world)
  (:objects
    red blue yellow orange - block
  )
  (:init
    ; initial configuration from observer1
    (on-table red)
    (on-table blue)
    (on-table orange)
    (on yellow orange)
    (clear red)
    (clear blue)
    (clear yellow)
    (handempty)
  )
  (:goal (and
    (on orange blue)
    (on yellow red)
  ))
)