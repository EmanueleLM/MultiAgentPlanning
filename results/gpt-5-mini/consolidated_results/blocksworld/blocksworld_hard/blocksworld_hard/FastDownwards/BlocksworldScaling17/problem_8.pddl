(define (problem blocks-problem-BlocksworldScaling17)
  (:domain blocksworld)
  (:objects
    red yellow orange blue - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )

  (:init
    ;; Initial physical configuration
    (on red orange)
    (on orange blue)
    (ontable blue)
    (ontable yellow)

    ;; Clear blocks (no block on top and not held)
    (clear red)
    (clear yellow)

    ;; Hand is empty at start
    (handempty)

    ;; Stage/time encoding: start at s0 and explicit successor relation
    (at s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
  )

  (:goal (and
           (on red blue)
           (on blue yellow)
           (on yellow orange)
        )
  )
)