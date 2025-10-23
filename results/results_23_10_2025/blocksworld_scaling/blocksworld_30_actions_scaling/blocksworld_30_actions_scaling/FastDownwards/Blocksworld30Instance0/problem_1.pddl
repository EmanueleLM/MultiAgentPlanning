(define (problem blocks-problem)
  (:domain blocks-domain)
  (:objects A B C D E F G H - block)

  (:init
    ;; initial on / ontable relations
    (ontable A)
    (ontable B)
    (ontable E)
    (ontable G)

    (on D A)
    (on F D)
    (on C E)
    (on H G)

    ;; initial clear blocks (tops)
    (clear F)
    (clear B)
    (clear C)
    (clear H)

    ;; robot hand is empty initially
    (handempty)
  )

  (:goal (and
    ;; final arrangement derived from the given action sequence
    (ontable A)
    (ontable B)
    (ontable E)
    (ontable D)

    (on C E)
    (on G C)
    (on F G)
    (on H B)
  ))
)