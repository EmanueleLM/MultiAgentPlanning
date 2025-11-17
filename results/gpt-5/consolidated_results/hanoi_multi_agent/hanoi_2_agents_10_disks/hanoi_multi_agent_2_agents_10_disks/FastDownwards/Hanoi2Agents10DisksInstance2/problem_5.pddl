(define (problem Hanoi2Agents10DisksInstance2)
  (:domain hanoi-two-agent)
  (:objects
    agent_1 agent_2 - agent
    left middle right - peg
    A B C D E F G H I J - disk
  )
  (:init
    (on J left)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    (clear A)
    (clear middle)
    (clear right)

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
      (on D right)
      (on C D)
      (on B C)
      (on A B)

      (on J left)
      (on I J)
      (on H I)
      (on G H)
      (on F G)
      (on E F)

      (clear middle)
    )
  )
)