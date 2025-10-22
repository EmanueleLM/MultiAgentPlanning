(define (problem Blocksworld20Instance16)
  (:domain blocksworld)
  (:objects A B C D E F G H I J - block)

  (:init
    ;; initial on / ontable facts (initial arrangement bottom->top):
    ;; Stack1: G - H - A
    (on A H)
    (on H G)
    (ontable G)

    ;; Stack2: B - J - F - C
    (on J B)
    (on F J)
    (on C F)
    (ontable B)

    ;; Stack3: D - I - E
    (on I D)
    (on E I)
    (ontable D)

    ;; clear facts: tops A, C, E are clear initially
    (clear A)
    (clear C)
    (clear E)

    ;; hand is empty at start
    (handempty)
  )

  (:goal (and
    ;; final arrangement computed from the given action sequence:
    ;; Stack1: G - H - A
    (on A H)
    (on H G)
    (ontable G)

    ;; Stack2: B - J - F
    (on J B)
    (on F J)
    (ontable B)

    ;; Stack3: D - I - E - C
    (on I D)
    (on E I)
    (on C E)
    (ontable D)
  ))
)