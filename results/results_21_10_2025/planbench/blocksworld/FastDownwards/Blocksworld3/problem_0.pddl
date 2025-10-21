(define (problem player1-problem)
  (:domain blocks-world)
  (:objects yellow red orange blue - block)
  (:init
    ;; Observations from player1
    (on yellow red)
    (on red orange)
    (on orange blue)
    (on-table blue)
    (clear yellow)
    (handempty)
  )
  (:goal (and
           (on red yellow)
           (on yellow blue)
         ))
)