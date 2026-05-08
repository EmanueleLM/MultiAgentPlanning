(define (problem assemble-colors-ordered)
  (:domain blocksworld-ordered)
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )

  (:init
    ;; Explicit stage ordering and initial current stage.
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (current s0)

    ;; Initial block configuration:
    ;; orange on blue, yellow on red, red and blue on the table.
    (on orange blue)
    (on yellow red)
    (ontable red)
    (ontable blue)

    ;; Clearness as stated (no blocks on top of orange and yellow and they are not held).
    (clear orange)
    (clear yellow)

    ;; Hand starts empty.
    (handempty)

    ;; All-different facts to forbid stacking a block onto itself.
    (diff red blue)   (diff red yellow)   (diff red orange)
    (diff blue red)   (diff blue yellow)   (diff blue orange)
    (diff yellow red) (diff yellow blue)   (diff yellow orange)
    (diff orange red) (diff orange blue)   (diff orange yellow)
  )

  ;; Goal requires both the target block relations and that the stage progression reached s8,
  ;; enforcing that exactly the allowed number of actions (one stage advance per action) was used.
  (:goal (and
    (on red yellow)
    (on blue orange)
    (current s8)
  ))
)