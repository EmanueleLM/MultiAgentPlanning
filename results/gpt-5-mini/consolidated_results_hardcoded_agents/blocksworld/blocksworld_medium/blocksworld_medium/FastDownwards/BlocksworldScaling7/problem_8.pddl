(define (problem blocksworld-scaling7)
  (:domain multi-agent-blocks)
  (:objects
    blue orange yellow red - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )

  (:init
    ;; Stage successor relation (contiguous progression)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6)
    (current s0)

    ;; Single shared hand initially empty
    (handempty)

    ;; Initial block arrangement
    (on blue red)
    (ontable red)
    (ontable orange)
    (ontable yellow)

    ;; Clearness initially (blocks with nothing on top and not held)
    (clear blue)
    (clear orange)
    (clear yellow)
  )

  (:goal (and
    (on red blue)
    (on blue orange)
    (on yellow red)
  ))
)