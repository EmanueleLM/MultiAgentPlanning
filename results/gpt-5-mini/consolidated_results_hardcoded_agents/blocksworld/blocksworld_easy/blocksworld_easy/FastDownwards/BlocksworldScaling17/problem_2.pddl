(define (problem stack-red-yellow-orange)
  (:domain blocks-order-staged)
  (:objects
    red orange yellow blue - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    ;; block placement and table status
    (on yellow blue)
    (ontable blue)
    (ontable red)
    (ontable orange)

    ;; clear status consistent with the above: yellow has nothing on top, red and orange are on the table and clear
    (clear yellow)
    (clear red)
    (clear orange)

    ;; hand and staging
    (handempty)
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )
  (:goal
    (and
      (on red yellow)
      (on orange red)
    )
  )
)