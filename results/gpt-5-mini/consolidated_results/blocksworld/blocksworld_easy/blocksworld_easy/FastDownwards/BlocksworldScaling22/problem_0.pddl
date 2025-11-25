(define (problem stack-orange-on-yellow)
  (:domain blocks-world)
  (:objects
    orange yellow - block
  )

  ; Normalization note:
  ; - All block names were normalized to lower-case identifiers: 'orange', 'yellow'.
  ; - A table object is not explicitly modeled as an object type; "ontable" facts denote table placement.
  ; No other names or facts were present in the inputs; no additional blocks were invented.

  (:init
    ;; The hand starts empty.
    (handempty)

    ;; Initial placements: both blocks start on the table and are clear.
    ;; (This is the minimal consistent initial state given the provided inputs.)
    (ontable orange)
    (ontable yellow)
    (clear orange)
    (clear yellow)
  )

  ;; Goal: orange must be on top of yellow, and the hand must be empty at the end.
  ;; Both are enforced as hard terminal conditions.
  (:goal (and
    (on orange yellow)
    (handempty)
  ))
)