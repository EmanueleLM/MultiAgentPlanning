(define (problem Blocksworld20Instance19)
  (:domain blocks-world)
  (:objects A B C D E F G - block)

  ;; Initial state:
  ;; Stack: D on A on B on E on table
  ;; C on table
  ;; G on F on table
  (:init
    (on A B)
    (on B E)
    (on D A)
    (on G F)

    (ontable C)
    (ontable E)
    (ontable F)

    ;; clear blocks (tops of stacks)
    (clear D)
    (clear C)
    (clear G)

    ;; hand starts empty
    (handempty)
  )

  ;; Goal: final arrangement derived from the action sequence
  ;; A on B, B on table, C on G, D on C, E on table, F on table, G on F
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