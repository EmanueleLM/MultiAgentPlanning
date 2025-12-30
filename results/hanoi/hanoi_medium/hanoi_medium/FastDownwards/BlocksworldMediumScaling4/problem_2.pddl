(define (problem BlocksworldMediumScaling4_problem)
  (:domain blocksworld)
  (:objects
    red orange yellow blue - block
  )
  (:init
    (= (total-cost) 0)
    (handempty)

    ; R on Y, O on B
    (on red yellow)
    (on orange blue)
    
    ; Y and B on table
    (on yellow table)
    (on blue table)

    ; Clear blocks: R, O
    (clear red)
    (clear orange)
  )
  (:goal (and
    (on red yellow)
    (on yellow orange)
  ))
  (:metric minimize (total-cost))
)