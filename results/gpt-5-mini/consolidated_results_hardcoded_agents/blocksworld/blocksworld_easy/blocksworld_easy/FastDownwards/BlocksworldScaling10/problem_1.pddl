(define (problem bw-problem-1)
  (:domain blocks-world)
  (:objects
    red yellow blue orange - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    ;; Initial block configuration provided by the specification
    (on red blue)
    (on yellow orange)
    (ontable blue)
    (ontable orange)

    ;; Clear/hand state per specification
    (clear red)
    (clear yellow)
    (handempty)

    ;; Stage ordering and initial current stage
    (at s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
  )
  (:goal (and
    (on orange red)
  ))
)