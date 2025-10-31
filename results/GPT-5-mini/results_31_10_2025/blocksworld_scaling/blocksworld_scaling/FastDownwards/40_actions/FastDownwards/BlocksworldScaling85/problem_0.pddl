(define (problem stack-orchestration)
  (:domain blocks_vowel_consonant)
  (:objects
    ; vowels
    A E I O - vowel
    ; consonants
    B C D F G H J K L M N - consonant
    ; stacks (preallocated finite set; orchestrator chose 15 slots)
    stack1 stack2 stack3 stack4 stack5 stack6 stack7 stack8 stack9 stack10 stack11 stack12 stack13 stack14 stack15 - stack
  )

  (:init
    ; initial active stacks
    (stack stack1)
    (stack stack2)
    (stack stack3)
    (stack stack4)
    ; other stacks are initially free
    (free_stack stack5) (free_stack stack6) (free_stack stack7) (free_stack stack8) (free_stack stack9)
    (free_stack stack10) (free_stack stack11) (free_stack stack12) (free_stack stack13) (free_stack stack14) (free_stack stack15)

    ; initial on-table and on relations (bottom-to-top per provided initial stacks)
    ; stack1: F (bottom) , D, L (top)
    (on-table F stack1)
    (on D F)
    (on L D)
    (top L stack1)

    ; stack2: J (bottom), G, C (top)
    (on-table J stack2)
    (on G J)
    (on C G)
    (top C stack2)

    ; stack3: I (bottom), B, K, M, N, A (top)
    (on-table I stack3)
    (on B I)
    (on K B)
    (on M K)
    (on N M)
    (on A N)
    (top A stack3)

    ; stack4: O (bottom), E, H (top)
    (on-table O stack4)
    (on E O)
    (on H E)
    (top H stack4)

    ; hand is empty initially
    (empty_hand)
  )

  (:goal
    (and
      ; final single stack must have O on the table (base) at stack4
      (on-table O stack4)

      ; required stacking order bottom->top:
      ; O, N, M, L, K, J, I, H, G, F, E, D, C, B, A  (A top)
      (on N O)
      (on M N)
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

      ; A must be the top of that stack
      (top A stack4)

      ; ensure the target stack exists (must hold)
      (stack stack4)
    )
  )
)