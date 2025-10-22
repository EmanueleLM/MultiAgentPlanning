(define (problem blocks-final)
  (:domain blocks-world)
  (:objects A B C D E F - block)

  ;; Initial state corresponds to the provided S0 (before action sequence)
  (:init
    (on A B)
    (on B C)
    (on C F)
    (on F D)
    (ontable D)
    (ontable E)
    (clear A)
    (clear E)
    (handempty)
  )

  ;; Goal encodes the final arrangement after the given action sequence
  (:goal (and
    (ontable A)
    (on B C)
    (on C F)
    (on F D)
    (ontable D)
    (ontable E)
  ))
)