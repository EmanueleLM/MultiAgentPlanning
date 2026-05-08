(define (problem blocksworld-ordered-prob)
  (:domain blocksworld-ordered)

  (:objects
    blue red orange yellow - block
    p0 p1 p2 - phase
  )

  (:init
    ;; block configuration:
    ;; blue on red, red on orange, orange on table, yellow on table
    (on blue red)
    (on red orange)
    (ontable orange)
    (ontable yellow)

    ;; clearness: blocks with no block on top and not held
    (clear blue)
    (clear yellow)
    ;; red and orange are not clear (they have blocks on top): do NOT assert clear for them

    ;; hand is initially empty
    (handempty)

    ;; phase ordering and initial current phase
    (current p0)
    (next p0 p1)
    (next p1 p2)
  )

  (:goal (and
    ;; mandatory placement constraints from the specification
    (on red orange)
    (on yellow blue)

    ;; require the plan to reach the final stage (explicit ordered termination)
    (current p2)
  ))
)