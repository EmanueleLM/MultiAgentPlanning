(define (problem stacker-problem)
  (:domain stacker)
  (:objects
    orange yellow blue red - block
  )
  (:init
    ;; table and stacking layout (explicit positive facts only).
    (ontable orange)
    (clear orange)

    (ontable red)
    (on blue red)
    (on yellow blue)
    (clear yellow)

    ;; hand is initially empty; no holding facts present.
    (handempty)

    ;; Note: clear(blue) and clear(red) are intentionally absent to represent
    ;; the facts ¬clear(blue) and ¬clear(red) (blue has yellow on it; red has blue on it).
    ;; No holding(...) facts are present initially, representing ¬holding(X) for all X.
  )

  ;; Mandated terminal condition: blue must be on yellow.
  (:goal (and
    (on blue yellow)
  ))
)