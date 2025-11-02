(define (problem bw-prob1)
  (:domain blocks-world)
  (:objects blue orange yellow red - block)
  (:init
    ;; initial arrangement: orange on yellow on red on table; blue on table
    (on orange yellow)
    (on yellow red)
    (ontable red)
    (ontable blue)

    ;; clear facts (only those that are true initially)
    (clear orange)
    (clear blue)

    ;; hand empty
    (handempty)
  )
  (:goal (and
    (on red orange)
    (on blue red)
    (on yellow blue)
  ))
)