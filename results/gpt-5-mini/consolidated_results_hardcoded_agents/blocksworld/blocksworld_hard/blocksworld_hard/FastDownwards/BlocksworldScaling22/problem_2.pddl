(define (problem BlocksworldScaling22-problem)
  (:domain blocksworld)
  (:objects
    red orange yellow blue table s0 s1 s2 s3 s4 - object
  )

  (:init
    ;; classify blocks
    (block red)
    (block orange)
    (block yellow)
    (block blue)

    ;; stages and successor relation (linear progression)
    (stage s0)
    (stage s1)
    (stage s2)
    (stage s3)
    (stage s4)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (current s0)

    ;; initial tower: blue on table, red on blue, yellow on red, orange on yellow
    (on blue table)
    (on red blue)
    (on yellow red)
    (on orange yellow)

    ;; only top block is clear initially
    (clear orange)

    ;; hand is empty initially
    (handempty)
  )

  (:goal (and
    (on red orange)
    (on orange yellow)
    (on yellow blue)
  ))
)