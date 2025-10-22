(define (problem blocks-final)
  (:domain blocks-world)
  (:objects A B C D E F G H - block)

  ;; Initial state: two stacks
  ;; Stack 1 (table bottom → up): A, C, E
  ;; Stack 2 (table bottom → up): F, B, H, G, D
  (:init
    ;; left stack
    (ontable A)
    (on C A)
    (on E C)

    ;; right stack
    (ontable F)
    (on B F)
    (on H B)
    (on G H)
    (on D G)

    ;; clear/top-of-stack facts (initial tops are E and D)
    (clear E)
    (clear D)

    ;; robot not holding anything at start
    (handempty)
  )

  ;; Goal: final arrangement derived from executing the given action sequence
  ;; Final stacks (table bottom → up):
  ;; Stack 1: A (table), C on A, E on C, D on E, G on D, H on G
  ;; Stack 2: B (table), F on B
  (:goal
    (and
      ;; left final stack
      (ontable A)
      (on C A)
      (on E C)
      (on D E)
      (on G D)
      (on H G)

      ;; right final stack
      (ontable B)
      (on F B)
    )
  )
)