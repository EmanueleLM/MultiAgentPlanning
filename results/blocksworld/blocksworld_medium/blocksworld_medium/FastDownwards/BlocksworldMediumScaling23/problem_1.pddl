(define (problem BlocksworldMediumScaling23)
  (:domain blocksworld)
  (:objects
    orange yellow red blue - block
  )
  
  (:init
    (ontable blue)
    (ontable orange)
    (on red blue)
    (on yellow red)
    
    (clear yellow)
    (clear orange)
    
    (handempty)
  )
  
  (:goal (and
    (on red orange)
    (on orange blue)
  ))
)