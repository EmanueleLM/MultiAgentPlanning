(define (problem BlocksworldScaling1-problem)
  (:domain BlocksworldScaling1)
  (:objects
    blue yellow red orange - block
    s0 s1 s2 s3 - stage
  )

  (:init
    ;; stacking relationships: yellow on red, red on orange
    (on red orange)
    (on yellow red)

    ;; table placement: blue and orange are on the table (orange supports red)
    (ontable blue)
    (ontable orange)

    ;; clear blocks: nothing on top of blue and yellow, and they are not held
    (clear blue)
    (clear yellow)

    ;; hand initially empty
    (handempty)

    ;; stage/time ordering: start at s0 and advance along next links
    (at-stage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
  )

  (:goal (and
    (on red orange)
    (on blue yellow)
    (on yellow red)
  ))
)