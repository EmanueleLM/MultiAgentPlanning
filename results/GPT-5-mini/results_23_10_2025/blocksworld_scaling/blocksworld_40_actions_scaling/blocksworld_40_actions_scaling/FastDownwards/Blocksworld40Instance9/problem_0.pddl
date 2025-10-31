(define (problem blocks-final)
  (:domain blocks)
  (:objects A B C D E F G H I - block)
  (:init
    ;; initial (public) arrangement
    (ontable A)
    (on B A)
    (on H B)

    (ontable I)
    (on C I)
    (on G C)

    (ontable E)
    (on D E)
    (on F D)

    ;; clear/top blocks initially
    (clear H)
    (clear G)
    (clear F)

    ;; no block held initially
    (handempty)
  )

  ;; goal is the final arrangement derived from the traces
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