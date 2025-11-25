(define (problem assemble-colors-ordered)
  (:domain blocksworld-ordered)
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ;; Stage ordering and starting stage
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (current s0)

    ;; Initial block configuration per specification:
    ;; orange is on top of blue; yellow is on top of red; red and blue are on the table
    (on orange blue)
    (on yellow red)
    (ontable red)
    (ontable blue)

    ;; Clearness: only orange and yellow are clear (they have nothing on top and are not held)
    (clear orange)
    (clear yellow)

    ;; Single hand starts empty
    (handempty)
  )

  ;; Terminal conditions must hold at final stage s4 (enforced as hard requirement)
  (:goal (and
    (on red yellow)
    (on blue orange)
    (current s4)
  ))
)