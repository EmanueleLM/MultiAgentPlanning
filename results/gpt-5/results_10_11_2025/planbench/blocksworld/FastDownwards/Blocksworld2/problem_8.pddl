(define (problem blocksworld2-a)
  (:domain blocksworld2)
  (:objects red yellow blue orange - block)
  (:init
    (clear blue)
    (handempty)
    (on blue orange)
    (on orange yellow)
    (on yellow red)
    (ontable red)
  )
  (:goal
    (and
      (on red orange)
      (on yellow red)
    )
  )
)