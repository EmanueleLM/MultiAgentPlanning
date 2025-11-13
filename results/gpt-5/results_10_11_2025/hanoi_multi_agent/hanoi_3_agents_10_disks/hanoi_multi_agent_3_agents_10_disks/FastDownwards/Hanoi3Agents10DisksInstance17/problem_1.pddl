(define (problem Hanoi3Agents10DisksInstance17)
  (:domain hanoi-3agents)
  (:objects
    left middle right - peg
    A B C D E F G H I J - disk
    agent_1 agent_2 agent_3 - agent
  )
  (:init
    ; size ordering (A smallest ... J largest)
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
    (canmove agent_1 A) (canmove agent_1 B) (canmove agent_1 C) (canmove agent_1 D)
    (canmove agent_2 E) (canmove agent_2 F) (canmove agent_2 G)
    (canmove agent_3 H) (canmove agent_3 I) (canmove agent_3 J)

    ; initial stack: left has A (top) ... J (bottom), others empty
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

    (clear A)
    (clear middle)
    (clear right)
  )

  (:goal (and
    ; right: A
    (on A right)

    ; middle: C on D
    (on C D)
    (on D middle)

    ; left: B on E on F on G on H on I on J on left
    (on B E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ; ensure the three tops are clear
    (clear A)
    (clear B)
    (clear C)
  ))
)