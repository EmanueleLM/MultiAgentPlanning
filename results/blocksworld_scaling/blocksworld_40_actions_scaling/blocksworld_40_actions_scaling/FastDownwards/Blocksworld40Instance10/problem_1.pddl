(define (problem blocks-final-state)
  (:domain blocks)
  (:objects A B C D E F G H I - block)

  ;; Initial state
  (:init
    ;; on relations (initial)
    (on A C)
    (on B I)
    (on D E)
    (on F H)
    (on G B)

    ;; ontable (initial bottoms)
    (ontable C)
    (ontable E)
    (ontable H)
    (ontable I)

    ;; clear (initial tops)
    (clear A)
    (clear G)
    (clear D)
    (clear F)

    ;; hand status
    (handempty)
  )

  ;; Goal: final arrangement after applying the given action sequence
  (:goal (and
    ;; stacked relations for the long stack
    (on B I)
    (on G B)
    (on F G)
    (on C F)
    (on H C)
    (on A H)

    ;; table blocks in final state
    (ontable I)  ;; base of the long stack
    (ontable E)
    (ontable D)

    ;; clear status in final state (tops of stacks / singles)
    (clear A)
    (clear E)
    (clear D)

    ;; final hand status
    (handempty)
  ))
)