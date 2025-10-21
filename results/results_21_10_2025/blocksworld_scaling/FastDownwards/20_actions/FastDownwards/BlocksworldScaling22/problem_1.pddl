(define (problem assemble-tower)
  (:domain two-agent-blocks)

  (:objects
    A E I - vowel
    B C D F G H J K L M - consonant
  )

  (:init
    ;; Stack1 bottom-to-top: H I E J
    (ontable H)
    (on I H)
    (on E I)
    (on J E)

    ;; Stack2 bottom-to-top: C B F
    (ontable C)
    (on B C)
    (on F B)

    ;; Stack3 bottom-to-top: G M K D
    (ontable G)
    (on M G)
    (on K M)
    (on D K)

    ;; Stack4 bottom-to-top: A L
    (ontable A)
    (on L A)

    ;; Clear (tops)
    (clear J)
    (clear F)
    (clear D)
    (clear L)
  )

  (:goal
    (and
      ;; Single stack from M (ontable) upwards: M L K J I H G F E D C B A
      (ontable M)
      (on L M)
      (on K L)
      (on J K)
      (on I J)
      (on H I)
      (on G H)
      (on F G)
      (on E F)
      (on D E)
      (on C D)
      (on B C)
      (on A B)
    )
  )
)