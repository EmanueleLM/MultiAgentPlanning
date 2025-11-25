(define (problem blocks_instance)
  (:domain blocks_world)

  ;; Objects (no explicit types used to maximize compatibility)
  (:objects
    orange yellow red blue table
  )

  ;; Initial state (perception)
  ;; - block relations and clearness facts as provided
  ;; - single shared hand represented by (handempty)
  (:init
    (on orange blue)
    (on yellow red)
    (on red table)
    (on blue table)
    (clear orange)
    (clear yellow)
    (handempty)
  )

  ;; Goal: red on blue (explicit terminal condition required)
  (:goal (and
    (on red blue)
  ))
)