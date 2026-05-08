(define (problem BlocksworldScaling2-problem)
  (:domain blocksworld-scaling2)
  (:objects
    red orange blue yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )
  (:init
    ;; Initial stack: yellow on red, red on orange, orange on blue, blue on table.
    (on red orange)
    (on orange blue)
    (on yellow red)
    (ontable blue)

    ;; Clear facts consistent with the stacking above:
    ;; yellow has nothing on top so it is clear; others have something on top so they are not listed as clear.
    (clear yellow)

    ;; Hand is empty initially.
    (handempty)

    ;; Stage/time ordering: start at s0 and require reaching s10. Actions must follow successors.
    (phase s0)
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
           (on yellow orange)
           (phase s10)))
)