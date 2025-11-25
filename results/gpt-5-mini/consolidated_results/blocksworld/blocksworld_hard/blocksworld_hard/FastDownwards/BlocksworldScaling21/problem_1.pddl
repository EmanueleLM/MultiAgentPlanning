(define (problem blocks-problem)
  (:domain blocksworld)
  (:objects
    red blue orange yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 - stage
  )
  (:init
    ;; initial stack: red on blue on orange on yellow on table
    (on red blue)
    (on blue orange)
    (on orange yellow)
    (ontable yellow)

    ;; only the top block is clear initially
    (clear red)

    ;; single hand initially free
    (handempty)

    ;; initial stage
    (stage s0)

    ;; explicit successor relations for discrete stages (one action per stage transition)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13)
  )
  (:goal (and
    ;; required goal relations exactly as specified
    (on blue orange)
    (on orange yellow)
    (on yellow red)

    ;; require reaching the final stage to enforce the explicit step bound
    (stage s13)
  ))
)