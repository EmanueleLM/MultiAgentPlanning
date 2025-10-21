(define (problem multi-agent-blocksworld-problem)
  (:domain multi-agent-blocksworld)
  (:objects
    I B J K G L F M A C H D E - block
    Stack1 Stack2 Stack3 Stack4 - stack
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; block classifications
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L) (consonant M)

    ;; Initial stacks as reported:
    ;; Stack1: I on table, B on I, J on B, L on J, M on L, H on M, D on H, E on D. Top is E.
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

    ;; Stack2: K on table, G on K, A on G, C on A. Top is C.
    (on_stack K Stack2)
    (on_block G K)
    (on_block A G)
    (on_block C A)
    (top C Stack2)
    (clear C)

    ;; Stack3: F on table. Top is F.
    (on_stack F Stack3)
    (top F Stack3)
    (clear F)

    ;; Stack4 initially empty (available as a table location to create a new stack)
    (empty Stack4)
  )

  (:goal (and
    ;; Desired final vertical chain:
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
    ;; M must be on the table (we use Stack4 as the designated final table stack)
    (on_stack M Stack4)
  ))
)