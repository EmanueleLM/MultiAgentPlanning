(define (problem build_full_tower)
  (:domain blocks_multiagent)
  (:objects
    A E I - vowel
    B C D F G H J K L - consonant
  )
  (:init
    ;; Initial on / ontable relations according to stacks
    ;; S1: (bottom) J, A, B (top)
    (ontable J)
    (on A J)
    (on B A)

    ;; S2: I, K, L, D, G, H (H top)
    (ontable I)
    (on K I)
    (on L K)
    (on D L)
    (on G D)
    (on H G)

    ;; S3: E, F (F top)
    (ontable E)
    (on F E)

    ;; S4: C (top)
    (ontable C)

    ;; Clear (top) blocks initially
    (clear B)
    (clear H)
    (clear F)
    (clear C)
  )

  (:goal
    (and
      ;; Desired final tower top->bottom: A on B on C on D on E on F on G on H on I on J on K on L on table (L ontable)
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J K)
      (on K L)
      (ontable L)
    )
  )
)