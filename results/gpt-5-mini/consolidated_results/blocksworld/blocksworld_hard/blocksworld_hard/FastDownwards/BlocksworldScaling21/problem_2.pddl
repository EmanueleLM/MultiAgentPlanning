(define (problem blocks-problem)
  (:domain blocksworld)
  (:objects
    red blue orange yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 - stage
  )
  (:init
    (on red blue)
    (on blue orange)
    (on orange yellow)
    (ontable yellow)
    (clear red)
    (handempty)
    (stage s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13)
  )
  (:goal (and
    (on blue orange)
    (on orange yellow)
    (on yellow red)
    (stage s13)
  ))
)