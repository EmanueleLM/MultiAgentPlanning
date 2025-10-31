(define (problem cooperative-hanoi-problem)
  (:domain cooperative-hanoi)
  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 - step
  )

  (:init
    ;; Initial configuration: all disks on left peg (A is smallest/top)
    (on-peg A left)
    (on-peg B left)
    (on-peg C left)
    (on-peg D left)
    (on-peg E left)
    (on-peg F left)
    (on-peg G left)
    (on-peg H left)
    (on-peg I left)
    (on-peg J left)
    (on-peg K left)
    (on-peg L left)
    (on-peg M left)
    (on-peg N left)
    (on-peg O left)
    (on-peg P left)
    (on-peg Q left)
    (on-peg R left)
    (on-peg S left)
    (on-peg T left)

    ;; Ownership: agent_1 may move A-J; agent_2 may move K-T
    (agent1_owned A)
    (agent1_owned B)
    (agent1_owned C)
    (agent1_owned D)
    (agent1_owned E)
    (agent1_owned F)
    (agent1_owned G)
    (agent1_owned H)
    (agent1_owned I)
    (agent1_owned J)

    (agent2_owned K)
    (agent2_owned L)
    (agent2_owned M)
    (agent2_owned N)
    (agent2_owned O)
    (agent2_owned P)
    (agent2_owned Q)
    (agent2_owned R)
    (agent2_owned S)
    (agent2_owned T)

    ;; Step control: start at s1
    (step s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)

    ;; Allowed moves encode the validated, ordered move list (only these moves are permitted at the corresponding steps).
    ;; Step 1: agent_1: move disk A from left to right
    (allowed-move s1 A left right)
    ;; Step 2: agent_1: move disk B from left to middle
    (allowed-move s2 B left middle)
    ;; Step 3: agent_1: move disk A from right to middle
    (allowed-move s3 A right middle)
    ;; Step 4: agent_1: move disk C from left to right
    (allowed-move s4 C left right)
    ;; Step 5: agent_1: move disk A from middle to left
    (allowed-move s5 A middle left)
    ;; Step 6: agent_1: move disk B from middle to right
    (allowed-move s6 B middle right)
  )

  ;; Goal: final disk placements as specified by the human specification.
  ;; Left peg should contain A, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T (top-to-bottom A then D..T),
  ;; middle peg must be empty, and right peg must contain B (top) then C.
  ;; We encode the goal by asserting the final on-peg location for every disk.
  (:goal (and
    (on-peg A left)
    (on-peg D left)
    (on-peg E left)
    (on-peg F left)
    (on-peg G left)
    (on-peg H left)
    (on-peg I left)
    (on-peg J left)
    (on-peg K left)
    (on-peg L left)
    (on-peg M left)
    (on-peg N left)
    (on-peg O left)
    (on-peg P left)
    (on-peg Q left)
    (on-peg R left)
    (on-peg S left)
    (on-peg T left)
    (on-peg B right)
    (on-peg C right)
  ))
)