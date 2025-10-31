(define (problem hanoi-agents-problem)
  (:domain hanoi-agents)

  (:objects
    a b c d e f g h i j k l m n o p q r s t - disk
    left middle right - peg
  )

  (:init
    ;; initial positions: all disks start on the left peg (top-to-bottom a..t)
    (on a left) (on b left) (on c left) (on d left) (on e left) (on f left)
    (on g left) (on h left) (on i left) (on j left) (on k left) (on l left)
    (on m left) (on n left) (on o left) (on p left) (on q left) (on r left)
    (on s left) (on t left)

    ;; sequencing: start at step0
    (step0)

    ;; agent capabilities: reflect provided data: agent_1 can move disks A-D (a,b,c,d)
    (can-agent1 a) (can-agent1 b) (can-agent1 c) (can-agent1 d)
    ;; agent_2 has no can-agent2 facts; its generic move action will be inert in this problem
    ;; (no (can-agent2 ...) facts)

    ;; Note: we do not need to enumerate explicit size relations because the domain actions
    ;; for agent_1 explicitly check for the presence of smaller disks among A-D where needed.
  )

  (:goal (and
    ;; target configuration requested by the user:
    ;; left peg top-to-bottom: B, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
    (on b left) (on e left) (on f left) (on g left) (on h left) (on i left)
    (on j left) (on k left) (on l left) (on m left) (on n left) (on o left)
    (on p left) (on q left) (on r left) (on s left) (on t left)
    ;; middle peg top-to-bottom: C
    (on c middle)
    ;; right peg top-to-bottom: A, D
    (on a right) (on d right)
  ))
)