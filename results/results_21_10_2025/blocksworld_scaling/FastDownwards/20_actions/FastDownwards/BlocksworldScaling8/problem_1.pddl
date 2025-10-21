(define (problem blocks-multiagent-instance)
  (:domain blocks-multiagent)

  (:objects
    A E I O - vowel
    N H G J L B D M K C F - consonant
  )

  (:init
    ;; Initial stacks as given:
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

    ;; Clear blocks (tops of stacks)
    (clear O)
    (clear F)

    ;; Note: All other 'clear' facts are intentionally omitted;
    ;; they are false in the initial state because something is on those blocks.
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