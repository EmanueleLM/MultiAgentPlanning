(define (problem blocks-problem)
  (:domain blocks-domain)
  (:objects A B C D E F G H - block)

  (:init
    ;; initial stacks: A - D - F ; B ; E - C ; G - H
    (ontable A)
    (ontable B)
    (ontable E)
    (ontable G)

    (on D A)
    (on F D)
    (on C E)
    (on H G)

    ;; clear blocks (tops)
    (clear F)
    (clear B)
    (clear C)
    (clear H)

    ;; robot hand is empty initially
    (handempty)
  )

  (:goal (and
    ;; final arrangement: A (table), B (table) with H on B,
    ;; E (table) with C on E, G on C, F on G, and D on table
    (ontable A)
    (ontable B)
    (ontable E)
    (ontable D)

    (on H B)
    (on C E)
    (on G C)
    (on F G)
  ))
)