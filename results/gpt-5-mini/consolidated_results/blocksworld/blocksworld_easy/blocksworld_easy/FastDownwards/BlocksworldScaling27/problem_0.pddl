(define (problem bw-problem-orange-on-blue)
  (:domain blocksworld)
  (:objects
    orange blue red - block
  )
  (:init
    ;; type membership
    (block orange)
    (block blue)
    (block red)

    ;; initial placements:
    ;; orange is on the table, blue is on the table, red is on orange
    (ontable orange)
    (ontable blue)
    (on red orange)

    ;; clear states: red and blue are clear; orange is not clear because red is on it
    (clear red)
    (clear blue)

    ;; agent starts with empty hand
    (handempty)
  )
  ;; Goal: orange must be on top of blue (explicit terminal condition)
  (:goal (and
    (on orange blue)
  ))
)