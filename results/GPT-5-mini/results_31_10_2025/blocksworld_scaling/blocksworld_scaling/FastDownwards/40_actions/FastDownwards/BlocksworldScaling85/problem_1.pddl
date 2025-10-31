(define (problem stack-orchestration)
  (:domain blocks_vowel_consonant)
  (:objects
    ; vowels
    A E I O - vowel
    ; consonants
    B C D F G H J K L M N - consonant
    ; stacks
    stack1 stack2 stack3 stack4 - stack
  )

  (:init
    ; active stacks (all four are initially occupied)
    (stack stack1)
    (stack stack2)
    (stack stack3)
    (stack stack4)

    ; initial stack contents (bottom-to-top)
    ; stack1: F (bottom), D, L (top)
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

    ; no free stacks initially
    ; (free_stack ...) none
  )

  (:goal
    (and
      ; O must remain as the base on the table at stack4
      (on-table O stack4)

      ; required final ordering bottom->top:
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

      ; A must be the top of stack4
      (top A stack4)

      ; ensure the target stack exists
      (stack stack4)
    )
  )
)