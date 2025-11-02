(define (problem Hanoi3Agents10DisksInstance0)
  (:domain hanoi-three-agents)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
    ; pegs and disks are both treated as places via typing in predicates
  )

  (:init
    ; initial direct support chain (top->bottom on left: A,B,C,D,E,F,G,H,I,J)
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

    ; peg emptiness
    (empty middle)
    (empty right)
    ; left is not empty -> do not assert (empty left)

    ; clear = no disk directly on top
    (clear A)
    ; B,C,...,J initially have disks on them above, so they are not clear (no facts)

    ; allowed moves per agent (static)
    (allowed agent_1 A)
    (allowed agent_1 B)
    (allowed agent_1 C)
    (allowed agent_1 D)

    (allowed agent_2 E)
    (allowed agent_2 F)
    (allowed agent_2 G)

    (allowed agent_3 H)
    (allowed agent_3 I)
    (allowed agent_3 J)

    ; size ordering (smaller X Y means X is smaller than Y)
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
    ; Right peg must have top->bottom A,C which is encoded as A on C and C on right
    (on A C)
    (on C right)

    ; Left peg must have top->bottom B,D,E,F,G,H,I,J
    (on B D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ; Middle peg empty
    (empty middle)
  ))
)