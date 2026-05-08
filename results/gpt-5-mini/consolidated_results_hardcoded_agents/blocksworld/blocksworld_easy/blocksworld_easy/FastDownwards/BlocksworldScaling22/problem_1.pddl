(define (problem stack-orange-on-yellow)
  (:domain blocks-world)
  (:objects
    red blue yellow orange - block
  )

  ; Normalization note:
  ; - Block names preserved as given: red, blue, yellow, orange.
  ; - Table is not an explicit object; ontables are represented by the predicate (ontable ?b).

  (:init
    ;; hand starts empty
    (handempty)

    ;; placements
    (on yellow orange)
    (ontable red)
    (ontable blue)
    (ontable orange)

    ;; clear predicates as provided: red, blue, and yellow are clear initially.
    ;; Note: orange is not clear because yellow is on it.
    (clear red)
    (clear blue)
    (clear yellow)
  )

  ;; Goal: orange on top of yellow (no extra terminal requirements beyond this).
  (:goal (and
    (on orange yellow)
  ))
)