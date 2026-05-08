(define (problem blocksworld-scaling28-p01)
  (:domain blocksworld-scaling28)
  (:objects
    orange red yellow blue - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )
  (:init
    ;; Initial block configuration (stack: orange on red on yellow on blue (table))
    (ontable blue)
    (on yellow blue)
    (on red yellow)
    (on orange red)
    (clear orange)
    (handempty)

    ;; Stage objects and initial at-stage
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4) (stage s5) (stage s6)
    (stage s7) (stage s8) (stage s9) (stage s10) (stage s11) (stage s12)
    (at-stage s0)

    ;; Successor relations enforce discrete stage progression; each action must consume the current stage and advance to the successor
    (successor s0 s1)
    (successor s1 s2)
    (successor s2 s3)
    (successor s3 s4)
    (successor s4 s5)
    (successor s5 s6)
    (successor s6 s7)
    (successor s7 s8)
    (successor s8 s9)
    (successor s9 s10)
    (successor s10 s11)
    (successor s11 s12)
  )
  (:goal (and
    (on red orange)
    (on blue red)
    (on orange yellow)
  ))
)