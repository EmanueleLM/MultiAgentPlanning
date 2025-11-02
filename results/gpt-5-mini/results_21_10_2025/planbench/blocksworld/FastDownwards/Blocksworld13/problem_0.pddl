(define (problem blocks-problem)
  (:domain blocksworld)

  (:objects
    red orange blue yellow - block
  )

  (:init
    ; Explicit block declarations (also provided via :objects)
    (block red)
    (block orange)
    (block blue)
    (block yellow)

    ; Initial spatial configuration (from actor1's validated initial state)
    (on red blue)
    (on blue orange)
    (on orange yellow)
    (on-table yellow)

    ; Clear/hand facts (from actor1)
    (clear red)
    (handempty)
  )

  ; Goal integrated from actor1's validated plan:
  ; final state requires: on(blue, orange), on(orange, yellow), on(yellow, red)
  (:goal (and
           (on blue orange)
           (on orange yellow)
           (on yellow red)
         )
  )
)