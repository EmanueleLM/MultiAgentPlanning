(define (problem blocks-final)
  (:domain blocks)
  (:objects A B C D E F G H I - block)

  ;; Initial state (as provided)
  (:init
    ;; on relations (initial)
    (on A C)
    (on B F)
    (on C E)
    (on D H)
    (on E B)
    (on G I)
    (on I D)

    ;; ontable bottoms (initial)
    (ontable F)
    (ontable H)

    ;; clear blocks (initial tops)
    (clear A)
    (clear G)

    ;; free hand
    (handempty)
  )

  ;; Goal: final arrangement after applying the 40-step sequence
  (:goal (and
    (on A C)
    (on C B)
    (on B F)
    (on F G)
    (on G I)
    (on I D)
    (on D H)
    (ontable H)
    (ontable E)
  ))
)