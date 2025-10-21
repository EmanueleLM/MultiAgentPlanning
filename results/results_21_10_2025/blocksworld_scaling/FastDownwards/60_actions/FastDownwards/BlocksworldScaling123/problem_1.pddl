(define (problem BlocksworldScaling123-problem)
  (:domain BlocksworldScaling123)

  (:objects
    I B J K G L F M A C H D E - block
    Stack1 Stack2 Stack3 - stack
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ;; classifications
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L) (consonant M)

    ;; Initial stacks as provided:
    ;; Stack1: I on table, B on I, J on B, L on J, M on L, H on M, D on H, E on D (top)
    (on_stack I Stack1)
    (on_block B I)
    (on_block J B)
    (on_block L J)
    (on_block M L)
    (on_block H M)
    (on_block D H)
    (on_block E D)
    (top E Stack1)
    (clear E)

    ;; Stack2: K on table, G on K, A on G, C on A (top)
    (on_stack K Stack2)
    (on_block G K)
    (on_block A G)
    (on_block C A)
    (top C Stack2)
    (clear C)

    ;; Stack3: F on table (top)
    (on_stack F Stack3)
    (top F Stack3)
    (clear F)

    ;; No stack is empty initially (3 table positions used).
  )

  (:goal (and
    ;; target vertical chain (final configuration), using Stack3 as the table position
    (on_block A B)
    (on_block B C)
    (on_block C D)
    (on_block D E)
    (on_block E F)
    (on_block F G)
    (on_block G H)
    (on_block H I)
    (on_block I J)
    (on_block J K)
    (on_block K L)
    (on_block L M)
    ;; M must be on the table (we require it to be on Stack3 in this problem's goal)
    (on_stack M Stack3)
  ))
)