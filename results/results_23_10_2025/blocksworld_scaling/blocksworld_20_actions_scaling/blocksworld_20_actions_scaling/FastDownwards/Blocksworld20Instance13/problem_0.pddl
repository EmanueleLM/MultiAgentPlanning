(define (problem blocksworld-instance)
  (:domain blocks-world)

  (:objects A B C D E F G H I J - block)

  ;; Initial state derived from the public information:
  ;; Stack1 (table) F -> A -> J -> H
  ;; Stack2 (table) B -> D -> I
  ;; Stack3 (table) G -> C -> E
  (:init
    ;; on relations (block on block)
    (on A F)
    (on J A)
    (on H J)
    (on D B)
    (on I D)
    (on C G)
    (on E C)

    ;; on table
    (ontable F)
    (ontable B)
    (ontable G)

    ;; clear/top blocks
    (clear H)
    (clear I)
    (clear E)

    ;; nothing is held at start
    (handempty)
  )

  ;; Goal: final arrangement after executing the given action sequence
  ;; Final arrangement (derived from the integrated analyses):
  ;; A on H
  ;; B on table
  ;; C on G
  ;; D on B
  ;; E on J
  ;; F on A
  ;; G on table
  ;; H on I
  ;; I on D
  ;; J on table
  (:goal
    (and
      (on A H)
      (ontable B)
      (on C G)
      (on D B)
      (on E J)
      (on F A)
      (ontable G)
      (on H I)
      (on I D)
      (ontable J)
    )
  )
)