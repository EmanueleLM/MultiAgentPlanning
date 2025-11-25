(define (problem blocks-instance)
  (:domain blocks-sequenced)

  (:objects
    red blue yellow orange - block
    table - table
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 - phase
  )

  (:init
    ;; initial tower: red on blue on yellow on orange on table
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (on orange table)

    ;; only top block is clear and hand is empty
    (clear red)
    (handempty)

    ;; start at first phase
    (at-phase p1)

    ;; explicit successor chain enforces ordered, contiguous stage progression
    (next p1 p2)
    (next p2 p3)
    (next p3 p4)
    (next p4 p5)
    (next p5 p6)
    (next p6 p7)
    (next p7 p8)
    (next p8 p9)
    (next p9 p10)
    (next p10 p11)
    (next p11 p12)
    (next p12 p13)
  )

  (:goal (and
    (on red blue)
    (on orange red)
    (on yellow orange)
    ;; require completion at the final phase to enforce full plan progression
    (at-phase p13)
  ))
)