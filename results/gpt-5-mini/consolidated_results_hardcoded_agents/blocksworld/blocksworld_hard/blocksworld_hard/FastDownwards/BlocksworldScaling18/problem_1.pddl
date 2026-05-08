(define (problem BlocksworldScaling18)
  (:domain blocks_world)
  (:objects
    blue red orange yellow - block
    table - place
  )
  (:init
    (handempty)
    (on red blue)
    (on orange red)
    (on blue table)
    (on yellow table)
    (clear orange)
    (clear yellow)
  )
  (:goal (and
    (on red orange)
    (on orange yellow)
    (on yellow blue)
  ))
)