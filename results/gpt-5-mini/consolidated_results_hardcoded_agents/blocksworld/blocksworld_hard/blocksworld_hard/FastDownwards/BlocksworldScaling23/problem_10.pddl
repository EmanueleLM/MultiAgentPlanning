(define (problem blocks-problem-staged)
  (:domain blocksworld_staged)

  (:objects
    yellow blue orange red - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )

  (:init
    ;; initial tower: red on table; orange on red; blue on orange; yellow on blue
    (on yellow blue)
    (on blue orange)
    (on orange red)
    (ontable red)

    ;; clearness: only top block is clear initially
    (clear yellow)

    ;; hand is empty
    (handempty)

    ;; discrete stage progression: start at s0 and only successors allowed
    (current s0)
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
    (next s10 s11)
    (next s11 s12)
  )

  (:goal (and
    ;; final stacked configuration must hold exactly at the terminal stage
    (on red blue)
    (on orange red)
    (on yellow orange)
    (current s12)
  ))
)