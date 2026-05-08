(define (problem BlocksworldScaling12_problem)
  (:domain blocksworld_stages)
  (:objects
    red blue yellow orange table - obj
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    ;; block declarations
    (block red) (block blue) (block yellow) (block orange)

    ;; initial placement
    (on red orange)
    (on blue table)
    (on orange table)
    (on yellow table)

    ;; clearing / hand status
    (clear red)
    (clear blue)
    (clear yellow)
    (handempty)

    ;; stage chain and initial stage
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6)
    (at-stage s0)
  )
  (:goal (and
    (on blue orange)
    (on orange yellow)
    (at-stage s6)
  ))
)