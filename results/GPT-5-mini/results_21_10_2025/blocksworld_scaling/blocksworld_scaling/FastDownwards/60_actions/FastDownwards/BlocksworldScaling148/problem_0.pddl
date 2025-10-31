(define (problem stack_goal_N_to_A)
  (:domain multiagent-blocks)
  (:objects
    A E I - vowel
    L M N K G B H C J D F - consonant
  )

  (:init
    ;; initial stacks:
    ;; stack1: bottom L, then E, then C (top)
    (ontable L)
    (on E L)
    (on C E)
    ;; stack2: bottom M, then K, then B, then J, then D, then F (top)
    (ontable M)
    (on K M)
    (on B K)
    (on J B)
    (on D J)
    (on F D)
    ;; stack3: bottom N, then I, then G, then H, then A (top)
    (ontable N)
    (on I N)
    (on G I)
    (on H G)
    (on A H)

    ;; clear (tops)
    (clear C)
    (clear F)
    (clear A)
  )

  (:goal
    (and
      ;; final single long stack N (on table) up to A (top)
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
    )
  )
)