(define (problem blocksworld-b)
  (:domain blocksworld)
  (:objects
    yellow red blue orange - block
  )
  (:init
    (clear blue)
    (clear orange)
    (handempty)
    (on red yellow)
    (on orange red)
    (ontable blue)
    (ontable yellow)
  )
  (:goal
    (and
      (on red blue)
      (on orange red)
      (on yellow orange)
    )
  )
)