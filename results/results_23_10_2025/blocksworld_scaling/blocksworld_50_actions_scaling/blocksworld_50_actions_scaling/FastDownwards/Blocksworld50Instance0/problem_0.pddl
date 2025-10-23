(define (problem blocks-final-goal)
  (:domain multi-agent-blocks)

  (:objects
    A B C D E F G H I J K L M - block
    robot1 robot2 - robot
  )

  ;; Initial state: the public initial arrangement (before integrating logs).
  ;; This represents the real initial block configuration (table stacks).
  (:init
    ;; Table stacks initial (bottom -> top encoded as on/ontable predicates):
    (ontable M)
    (on A M)
    (on L A)
    (on E L)
    (on B E)

    (ontable H)
    (on F H)
    (on D F)
    (on K D)
    (on G K)
    (on J G)
    (on C J)
    (on I C)

    ;; Clear blocks initially (tops of the two stacks):
    (clear B)
    (clear I)

    ;; Non-clear blocks (explicit negative preconditions not needed here; the
    ;; planner will infer others are not clear).
    ;; Robots' initial availability as supported by verified logs:
    (handempty robot1)
    (handempty robot2)
  )

  ;; Goal: final arrangement as computed by integrating the two agents' logs.
  ;; Final configuration (each block is either on another block or on the table).
  ;; From integration the final stacks are:
  ;; - Tower1: H - F - D - K - G - J - L  (H on table, L top)
  ;; - Tower2: I - C - B                    (I on table, B top)
  ;; - Tower3: M - A                        (M on table, A on M)
  ;; - E is on the table alone
  (:goal (and
    ;; Tower1
    (ontable H)
    (on F H)
    (on D F)
    (on K D)
    (on G K)
    (on J G)
    (on L J)

    ;; Tower2
    (ontable I)
    (on C I)
    (on B C)

    ;; Tower3
    (ontable M)
    (on A M)

    ;; E on table
    (ontable E)
  ))

)