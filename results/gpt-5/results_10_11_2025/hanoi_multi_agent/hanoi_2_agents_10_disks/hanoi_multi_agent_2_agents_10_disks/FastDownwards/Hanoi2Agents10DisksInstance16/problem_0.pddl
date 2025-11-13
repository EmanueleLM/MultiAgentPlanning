(define (problem hanoi_2agent_ordered_p10)
  (:domain hanoi_2agent_ordered)
  (:objects
    agent_1 agent_2 - agent
    A B C D E F G H I J - disk
    left middle right - peg
    s0 s1 s2 s3 - step
  )
  (:init
    ; size ordering: smaller(x,y) iff x is smaller than y
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; agent permissions
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)
    (can-move agent_1 E)
    (can-move agent_2 F)
    (can-move agent_2 G)
    (can-move agent_2 H)
    (can-move agent_2 I)
    (can-move agent_2 J)

    ; initial stack: A on B on ... on J on left
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

    ; clear statuses: only A among disks; middle and right pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ; sequencing: only the three audited moves are permitted
    (phase s0)
    ; 1) agent_1 moves A from left to right
    (allowed-peg agent_1 A left right s0 s1)
    ; 2) agent_1 moves B from left to middle
    (allowed-peg agent_1 B left middle s1 s2)
    ; 3) agent_1 moves A from right to middle (onto disk B)
    (allowed-disk agent_1 A right B s2 s3)
  )

  (:goal (and
    ; goal stacks
    (on A B)
    (on B middle)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)
    ; right peg is empty
    (clear right)
    ; enforce completion exactly after the third move
    (phase s3)
  ))
)