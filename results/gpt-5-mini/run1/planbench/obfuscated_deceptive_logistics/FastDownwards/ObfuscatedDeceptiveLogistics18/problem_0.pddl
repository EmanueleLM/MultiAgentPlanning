(define (problem reorder-problem)
  (:domain reorder-list)
  (:objects
    start end
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
  )
  (:init
    ;; explicit linear chain: start -> object_1 -> ... -> object_10 -> object_11 -> end
    (next start object_1)
    (next object_1 object_2)
    (next object_2 object_3)
    (next object_3 object_4)
    (next object_4 object_5)
    (next object_5 object_6)
    (next object_6 object_7)
    (next object_7 object_8)
    (next object_8 object_9)
    (next object_9 object_10)
    (next object_10 object_11)
    (next object_11 end)
  )
  ;; Goal: object_11 must be immediately before object_10 in the final linear sequence.
  ;; This is a hard terminal condition: the solver must produce a final chain where
  ;; (next object_11 object_10) holds.
  (:goal (and
    (next object_11 object_10)
  ))
)