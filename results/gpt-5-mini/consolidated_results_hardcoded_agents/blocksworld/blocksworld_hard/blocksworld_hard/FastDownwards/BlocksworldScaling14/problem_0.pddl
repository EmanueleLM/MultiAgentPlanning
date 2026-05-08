(define (problem blocks-problem)
  (:domain blocks-picker)
  (:objects
    red blue yellow orange table
  )
  (:init
    ;; Initial tower: yellow on red, red on blue, blue on orange, orange on table
    (on red blue)
    (on blue orange)
    (on yellow red)
    (on orange table)

    ;; Top block is yellow
    (clear yellow)

    ;; Hand is initially empty
    (hand-empty)
  )
  (:goal (and
    ;; Goal: red directly on orange, and yellow directly on blue
    (on red orange)
    (on yellow blue)
  ))
)