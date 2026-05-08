(define (problem blocks-problem)
  (:domain blocksworld)
  (:objects
    red blue orange yellow - block
  )
  (:init
    ;; initial stacking: red on blue, blue on orange, orange on yellow, yellow on table
    (on red blue)
    (on blue orange)
    (on orange yellow)
    (ontable yellow)

    ;; only red is clear initially and hand is empty
    (clear red)
    (handempty)
  )
  (:goal (and
    ;; desired final stacking
    (on blue orange)
    (on orange yellow)
    (on yellow red)
  ))
)