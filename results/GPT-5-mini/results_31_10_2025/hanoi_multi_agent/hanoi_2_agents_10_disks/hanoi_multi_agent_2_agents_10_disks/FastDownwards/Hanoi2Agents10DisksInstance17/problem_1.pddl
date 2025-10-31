(define (problem Hanoi2Agents10DisksInstance17)
  (:domain hanoi-2agents-10)
  (:objects
    agent_1 agent_2 orchestrator - agent
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left: top-to-bottom A B C D E F G H I J
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    ;; Clear places initially: top disk A is clear, other pegs empty
    (clear A)
    (clear middle)
    (clear right)

    ;; Agent permissions
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

    ;; Size relations (smaller x y means x is smaller than y)
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
    ;; Left peg desired stack top-to-bottom: B D E F G H I J
    (on B left)
    (on D B)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    ;; Right peg desired stack top-to-bottom: A C  (A on C, C on right)
    (on A C)
    (on C right)

    ;; Middle peg empty
    (clear middle)
  ))
)