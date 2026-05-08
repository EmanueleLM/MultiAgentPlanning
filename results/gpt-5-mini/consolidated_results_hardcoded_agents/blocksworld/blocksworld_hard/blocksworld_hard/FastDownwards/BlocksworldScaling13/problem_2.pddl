(define (problem stack-red-blue-orange-yellow)
  (:domain blocksworld)
  (:objects
    red blue orange yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )
  (:init
    ; Blocks initial configuration (as provided)
    (on red orange)
    (on yellow blue)
    (ontable blue)
    (ontable orange)

    (clear red)
    (clear yellow)

    (handempty)

    ; Stage successor chain (static)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)

    ; Start at the first stage (exactly one at-stage fact true initially)
    (at-stage s0)
  )

  ; Goal: red on blue on orange on yellow, anchored to table,
  ; and reached at final stage s10 to enforce ordered progression.
  (:goal (and
    (on red blue)
    (on blue orange)
    (on orange yellow)
    (ontable yellow)
    (at-stage s10)
  ))
)