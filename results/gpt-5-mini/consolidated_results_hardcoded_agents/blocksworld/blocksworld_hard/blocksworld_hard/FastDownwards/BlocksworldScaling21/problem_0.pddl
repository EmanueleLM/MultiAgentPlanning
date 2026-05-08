(define (problem blocks-problem)
  (:domain blocks)
  (:objects red blue orange yellow - block)
  (:init
    ;; type facts
    (block red)
    (block blue)
    (block orange)
    (block yellow)

    ;; initial placement:
    ;; red and blue are on the table; orange is on red; yellow is on blue
    (ontable red)
    (ontable blue)
    (on orange red)
    (on yellow blue)

    ;; clear blocks (those with nothing on top)
    (clear orange)
    (clear yellow)

    ;; single-hand initially free
    (handempty)
  )
  (:goal (and
    ;; final single tower: red on table, blue on red, orange on blue, yellow on orange
    (ontable red)
    (on blue red)
    (on orange blue)
    (on yellow orange)

    ;; top is clear and hand is empty at termination
    (clear yellow)
    (handempty)
  ))
)