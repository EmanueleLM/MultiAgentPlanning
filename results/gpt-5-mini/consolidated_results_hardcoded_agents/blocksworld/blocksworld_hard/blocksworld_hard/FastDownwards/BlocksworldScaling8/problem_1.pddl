(define (problem BlocksworldScaling8-prob)
  (:domain BlocksworldScaling8)
  (:objects
    red yellow blue orange - block
    s0 s1 s2 s3 s4 s5 s6 - step
  )
  (:init
    ;; single-handedness
    (handempty)

    ;; initial stacking: red on yellow on blue on orange on table
    (on red yellow)
    (on yellow blue)
    (on blue orange)
    (ontable orange)

    ;; clear predicates (only the top block is clear)
    (clear red)

    ;; stage control: start at s0 and define successor chain
    (at s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
  )
  (:goal (and
    (on red blue)
    (on orange red)
  ))
)