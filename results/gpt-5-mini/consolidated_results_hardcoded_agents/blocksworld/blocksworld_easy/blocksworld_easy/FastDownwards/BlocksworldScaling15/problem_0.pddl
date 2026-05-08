(define (problem stacker-instance)
  (:domain blocks-stacker)
  (:objects
    blue red yellow orange - block
  )
  (:init
    ;; initial block placements
    (on blue red)
    (on yellow blue)
    (on-table red)
    (on-table orange)

    ;; clear facts (note: yellow is clear because nothing on top of it;
    ;; blue is not clear initially because yellow is on it)
    (clear yellow)
    (clear orange)

    ;; single-hand start condition
    (handempty)
  )

  (:goal (and
    (on blue yellow)
    (on yellow orange)
  ))
)