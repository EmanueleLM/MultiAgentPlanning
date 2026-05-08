(define (problem build-blue-on-orange-on-yellow)
  (:domain blocks-world)
  (:objects
    blue red yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )
  (:init
    ;; initial stack: orange on table, red on orange, blue on red, yellow on blue (yellow is top and clear)
    (on-table orange)
    (on red orange)
    (on blue red)
    (on yellow blue)
    (clear yellow)
    ;; others are not clear by omission (red, blue, orange not asserted clear)
    (handempty)

    ;; discrete stage progression: start at s0 and successors up to s10
    (current s0)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10)
  )
  (:goal (and
    (on blue orange)
    (on orange yellow)
  ))
)