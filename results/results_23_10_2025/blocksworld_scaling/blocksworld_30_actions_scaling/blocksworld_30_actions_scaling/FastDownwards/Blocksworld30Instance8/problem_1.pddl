(define (problem Blocksworld30Instance8)
  (:domain blocks-world)
  (:objects A B C D E F G H I J - block)

  (:init
    ;; Stack1 bottom->top: C, I, F, D, A
    (ontable C)
    (on I C)
    (on F I)
    (on D F)
    (on A D)

    ;; Stack2 bottom->top: E, B, J, G, H
    (ontable E)
    (on B E)
    (on J B)
    (on G J)
    (on H G)

    ;; clear = top blocks
    (clear A)
    (clear H)

    ;; hand initially empty
    (handempty)
  )

  (:goal (and
    (on A D)
    (on B E)
    (ontable C)
    (on D F)
    (ontable E)
    (on F I)
    (on G A)
    (ontable H)
    (on I C)
    (on J B)
  ))
)