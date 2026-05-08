(define (problem build-tower)
  (:domain blocks_agents)
  (:objects
    red blue yellow orange - block
  )
  (:init
    ;; initial facts exactly as provided
    (clear red)
    (clear blue)
    (clear yellow)
    (handempty)
    (on yellow orange)
    (ontable red)
    (ontable blue)
    (ontable orange)
  )
  ;; Goal: full tower with red on blue on yellow on orange (orange on table),
  ;; and hand empty at the end. These are required terminal conditions.
  (:goal
    (and
      (on red blue)
      (on blue yellow)
      (on yellow orange)
      (ontable orange)
      (handempty)
    )
  )
)