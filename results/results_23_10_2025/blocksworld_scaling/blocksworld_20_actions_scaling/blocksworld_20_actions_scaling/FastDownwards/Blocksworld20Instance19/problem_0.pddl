(define (problem bw-problem-1)
  (:domain blocks-world)
  (:objects A B C D E F G - block)

  ;; Initial state derived from the provided description:
  ;; A on B, B on E, D on A, C on table, E on table, F on table, G on F.
  (:init
    (on A B)
    (on B E)
    (on D A)
    (on G F)

    (ontable C)
    (ontable E)
    (ontable F)

    ;; clear blocks in the initial configuration
    (clear D)
    (clear G)
    (clear C)

    ;; hand starts empty
    (handempty)
  )

  ;; Goal: final arrangement produced by the given action sequence:
  ;; A on B, B on table, C on G, D on C, E on table, F on table, G on F.
  (:goal
    (and
      (on A B)
      (ontable B)
      (on C G)
      (on D C)
      (ontable E)
      (ontable F)
      (on G F)
    )
  )
)