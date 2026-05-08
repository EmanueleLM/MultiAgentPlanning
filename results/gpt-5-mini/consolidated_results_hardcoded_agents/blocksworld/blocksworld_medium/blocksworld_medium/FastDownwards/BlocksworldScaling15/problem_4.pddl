(define (problem assemble-colors-ordered)
  (:domain blocksworld-ordered)
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )

  (:init
    ;; Stage ordering and starting stage
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
    (on orange blue)
    (on yellow red)
    (ontable red)
    (ontable blue)

    ;; Clear blocks per specification:
    (clear orange)
    (clear yellow)

    ;; Single hand starts empty
    (handempty)

    ;; Distinctness facts to prevent self-stacking/unstacking
    (diff red blue)   (diff red yellow)   (diff red orange)
    (diff blue red)   (diff blue yellow)   (diff blue orange)
    (diff yellow red) (diff yellow blue)   (diff yellow orange)
    (diff orange red) (diff orange blue)   (diff orange yellow)
  )

  ;; Terminal conditions must hold at final stage s8
  (:goal (and
    (on red yellow)
    (on blue orange)
    (current s8)
  ))
)