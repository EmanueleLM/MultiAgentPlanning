(define (problem blocks-multiagent-instance)
  (:domain blocks-multiagent)
  (:objects
    A E I O - vowel
    N H G J L B D M K C F - consonant
    A B C D E F G H I J K L M N O - block  ; include all blocks again typed as block for predicates
  )
  (:init
    ;; Stack 1 (top to bottom): O I D L J E G A N
    (on O I)
    (on I D)
    (on D L)
    (on L J)
    (on J E)
    (on E G)
    (on G A)
    (on A N)
    (ontable N)

    ;; Stack 2 (top to bottom): F C K M B H
    (on F C)
    (on C K)
    (on K M)
    (on M B)
    (on B H)
    (ontable H)

    ;; Clear (tops of stacks)
    (clear O)
    (clear F)
  )

  (:goal (and
    ;; Desired single stack from top A down to bottom O on table:
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
    (on L M)
    (on M N)
    (on N O)
    (ontable O)
  ))
)