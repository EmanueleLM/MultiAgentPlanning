(define (problem hanoi-10-agent-perm)
  (:domain hanoi-agent)
  (:objects
    agent_1 agent_2 agent_3 - agent
    left middle right - peg
    A B C D E F G H I J - disk
  )
  (:init
    ; initial stack: A on B, B on C, ..., I on J, J on left
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

    ; clear locations initially
    (clear A)
    (clear middle)
    (clear right)

    ; agent move permissions
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)

    (can-move agent_2 E)
    (can-move agent_2 F)
    (can-move agent_2 G)

    (can-move agent_3 H)
    (can-move agent_3 I)
    (can-move agent_3 J)

    ; size ordering: smaller(X,Y) for all X < Y
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
  (:goal
    (and
      ; final left stack: A on C on D on E on F on G on H on I on J on left
      (on A C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J left)

      ; final right: B on right
      (on B right)

      ; middle peg clear
      (clear middle)

      ; A and B are clear
      (clear A)
      (clear B)
    )
  )
)