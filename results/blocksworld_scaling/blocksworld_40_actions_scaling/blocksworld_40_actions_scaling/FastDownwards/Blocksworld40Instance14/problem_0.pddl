(define (problem blocks-final)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K - block
    robot1 robot2 - agent
  )

  ;; Initial state (as given in the public information)
  (:init
    ;; on relationships (bottom-to-top in each initial stack)
    (on D B)
    (on G C)
    (on F G)
    (on J F)
    (on I J)
    (on K I)
    (on H E)

    ;; ontable for bottoms of stacks
    (ontable A)
    (ontable B)
    (ontable C)
    (ontable E)

    ;; clear blocks (tops of initial stacks)
    (clear A)
    (clear D)
    (clear K)
    (clear H)

    ;; robots start with empty hands
    (handempty robot1)
    (handempty robot2)
  )

  ;; Goal: final arrangement after executing the provided interleaved actions
  (:goal
    (and
      ;; final on relationships matching stacks:
      ;; Stack 1: [C G F J I]  (C on table, G on C, F on G, J on F, I on J)
      (on G C)
      (on F G)
      (on J F)
      (on I J)
      ;; Stack 2: [E H D] (E on table, H on E, D on H)
      (on H E)
      (on D H)
      ;; Stack 3: [A K] (A on table, K on A)
      (on K A)
      ;; Stack 4: [B] (B on table)
      ;; ontable facts for bottoms
      (ontable C)
      (ontable E)
      (ontable A)
      (ontable B)

      ;; clear tops of each final stack
      (clear I)
      (clear D)
      (clear K)
      (clear B)

      ;; no robot is holding any block in the final global state
      (handempty robot1)
      (handempty robot2)
    )
  )
)