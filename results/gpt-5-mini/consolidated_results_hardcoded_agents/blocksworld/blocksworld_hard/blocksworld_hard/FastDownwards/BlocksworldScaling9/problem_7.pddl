(define (problem blocks-problem)
  (:domain blocks-domain)
  (:objects
    red yellow orange blue - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 - stage
  )

  (:init
    ;; initial stacking: blue <- orange <- yellow (blue bottom, yellow top)
    (on orange blue)
    (on yellow orange)

    ;; red separate on the table
    (on-table red)
    (on-table blue)

    ;; clear blocks (no block on top and not held)
    (clear red)
    (clear yellow)

    ;; hand state
    (handempty)

    ;; initial stage
    (at-stage s0)

    ;; ordered stage progression (bounded explicit timeline)
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
    (succ s12 s13)
    (succ s13 s14)
  )

  (:goal (and
    (on red blue)
    (on orange yellow)
    (on yellow red)
    (at-stage s14)
  ))
)