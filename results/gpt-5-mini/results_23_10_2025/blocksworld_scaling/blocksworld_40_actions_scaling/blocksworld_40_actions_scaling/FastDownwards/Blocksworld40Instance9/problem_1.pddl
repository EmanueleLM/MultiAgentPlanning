(define (problem blocks-final)
  (:domain blocks)
  (:objects A B C D E F G H I - block)
  (:init
    ;; initial arrangement (public)
    (ontable A)
    (on B A)
    (on H B)

    (ontable I)
    (on C I)
    (on G C)

    (ontable E)
    (on D E)
    (on F D)

    ;; initial clear (tops of stacks)
    (clear H)
    (clear G)
    (clear F)

    ;; hand is initially empty
    (handempty)
  )

  ;; goal corresponds to the final arrangement derived from the executed action sequence
  (:goal (and
    (ontable A)
    (on B A)
    (on H B)

    (ontable I)
    (on C I)
    (on G C)
    (on E G)
    (on D E)

    (ontable F)
  ))
)