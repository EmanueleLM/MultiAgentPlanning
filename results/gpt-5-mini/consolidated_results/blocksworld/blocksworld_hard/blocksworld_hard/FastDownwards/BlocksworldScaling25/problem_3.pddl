(define (problem BlocksworldScaling25-prob)
  (:domain BlocksworldScaling25)
  (:objects
    blue red orange yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )
  (:init
    ;; stack: orange on yellow on blue on red (red on table), orange clear, hand empty
    (on blue red)
    (on orange yellow)
    (on yellow blue)
    (ontable red)
    (clear orange)
    (handempty)

    ;; stage/time progression: start at s0
    (at s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)
    (succ s9 s10)
    (succ s10 s11)
    (succ s11 s12)
  )
  (:goal (and
    (on blue yellow)
    (on orange red)
    (on yellow orange)
  ))
)