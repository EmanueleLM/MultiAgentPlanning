(define (problem blocks-problem)
  (:domain blocks-orchestrator)
  (:objects orange red yellow blue - block)

  (:init
    ; Given tower: orange on red on yellow on blue on table
    (on orange red)
    (on red yellow)
    (on yellow blue)
    (ontable blue)

    ; Clear and hand facts (from the public information)
    (clear orange)
    (handempty)
  )

  ; Goal: yellow directly on orange
  (:goal (and
    (on yellow orange)
  ))
)