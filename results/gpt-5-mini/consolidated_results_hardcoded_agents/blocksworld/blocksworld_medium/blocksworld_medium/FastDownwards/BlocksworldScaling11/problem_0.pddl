(define (problem blocks-stack-blue-yellow-red)
  (:domain blocks)
  (:objects
    blue yellow red - block
    h - hand
  )
  (:init
    ; initial positions: all blocks start on the table and are clear
    (ontable blue)
    (ontable yellow)
    (ontable red)
    (clear blue)
    (clear yellow)
    (clear red)

    ; single-hand available and empty
    (handempty h)
  )
  (:goal (and
           (on blue yellow)
           (on yellow red)
         ))
)