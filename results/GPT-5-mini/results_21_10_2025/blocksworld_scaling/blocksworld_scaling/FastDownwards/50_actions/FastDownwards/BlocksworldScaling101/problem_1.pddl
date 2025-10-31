(define (problem BlocksworldScaling101-problem)
  (:domain BlocksworldScaling101)
  (:objects
    J A M B N K D I F G L E C H - block
  )

  (:init
    ; initial on relationships (from bottom->top stacks)
    ; stack1: J B F G  => on(B J), on(F B), on(G F), ontable J
    (on B J)
    (on F B)
    (on G F)
    (ontable J)

    ; stack2: A N K I E C H  => on(N A), on(K N), on(I K), on(E I), on(C E), on(H C), ontable A
    (on N A)
    (on K N)
    (on I K)
    (on E I)
    (on C E)
    (on H C)
    (ontable A)

    ; stack3: M D L  => on(D M), on(L D), ontable M
    (on D M)
    (on L D)
    (ontable M)

    ; clear (top-of-stack) initial facts
    (clear G)
    (clear H)
    (clear L)

    ; unary type facts for vowel / consonant (agents' domains)
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
    (consonant M)
    (consonant N)
  )

  (:goal (and
    ; final stack (bottom to top): N M L K J I H G F E D C B A
    (ontable N)
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
  ))
)