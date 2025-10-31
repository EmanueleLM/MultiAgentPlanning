(define (problem build_full_tower)
  (:domain blocks_multiagent)
  (:objects
    A E I - vowel
    B C D F G H J K L - consonant
  )
  (:init
    ;; Stack 1 (bottom-to-top): J, A, B
    (ontable J)
    (on A J)
    (on B A)

    ;; Stack 2 (bottom-to-top): I, K, L, D, G, H (H top)
    (ontable I)
    (on K I)
    (on L K)
    (on D L)
    (on G D)
    (on H G)

    ;; Stack 3: E, F (F top)
    (ontable E)
    (on F E)

    ;; Stack 4: C on the table
    (ontable C)

    ;; Clear/top facts initially (tops of each stack)
    (clear B)
    (clear H)
    (clear F)
    (clear C)
  )

  (:goal
    (and
      ;; Final desired single tower (top A ... bottom L on table)
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