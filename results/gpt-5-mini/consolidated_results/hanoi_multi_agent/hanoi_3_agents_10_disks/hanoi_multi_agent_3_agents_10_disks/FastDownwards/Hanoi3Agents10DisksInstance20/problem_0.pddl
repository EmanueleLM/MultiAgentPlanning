(define (problem hanoi-multiagent-problem)
  (:domain hanoi-multiagent)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
  )

  (:init
    ;; Initial stack on the left peg (top-down): A B C D E F G H I J
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ;; Clear status: top disk A is clear; middle and right pegs are empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ;; Agent permissions: only agent_1 may move disks A, B, C, D
    (allowed agent_1 A)
    (allowed agent_1 B)
    (allowed agent_1 C)
    (allowed agent_1 D)
    ;; No (allowed agent_2 ...) or (allowed agent_3 ...) facts are provided,
    ;; enforcing that agents 2 and 3 do not move any disks (hard constraint).

    ;; Size ordering (smaller relations). Letters imply increasing size A < B < ... < J.
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)
  )

  (:goal (and
    ;; Goal: disks A-D moved to the right peg in correct stacking (A on B on C on D on right)
    (on A B)
    (on B C)
    (on C D)
    (on D right)

    ;; Goal: disks E-J remain on the left peg in their original relative order
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)
  ))