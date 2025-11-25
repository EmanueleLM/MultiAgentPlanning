(define (problem bw-problem-orange-on-blue)
  (:domain blocksworld)
  (:objects
    blue orange red yellow - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    ;; Initial block configuration: yellow <- red <- orange <- blue (yellow on table, red on yellow, orange on red, blue on orange)
    (on blue orange)
    (on orange red)
    (on red yellow)
    (ontable yellow)

    ;; Top is blue, hand empty
    (clear blue)
    (handempty)

    ;; Stage ordering for strict, contiguous time progression.
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (current s0)
  )
  ;; Goal requires the desired configuration and that execution reached the terminal stage s4,
  ;; enforcing the finite, contiguous progression of stages as a hard requirement.
  (:goal (and
    (on orange blue)
    (current s4)
  ))
)