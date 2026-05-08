(define (problem hanoi_instance)
  (:domain hanoi_multiagent)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
  )

  (:init
    ; initial locations (all disks on left, top->bottom A..J)
    (on A left) (on B left) (on C left) (on D left) (on E left)
    (on F left) (on G left) (on H left) (on I left) (on J left)

    ; top and above relations for left stack (adjacent above relations)
    (top A left)
    (above A B) (above B C) (above C D) (above D E) (above E F)
    (above F G) (above G H) (above H I) (above I J)
    (bottom J left)

    ; other pegs empty
    (peg-empty middle)
    (peg-empty right)

    ; size order: smaller facts (explicit for all pairs where first is smaller than second)
    ; A smallest, J largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; agent movement capabilities
    (can-move agent_1 A) (can-move agent_1 B) (can-move agent_1 C) (can-move agent_1 D)
    (can-move agent_2 E) (can-move agent_2 F) (can-move agent_2 G)
    (can-move agent_3 H) (can-move agent_3 I) (can-move agent_3 J)
  )

  (:goal
    (and
      ; Left peg final stack top->bottom D,E,F,G,H,I,J
      (on D left) (on E left) (on F left) (on G left) (on H left) (on I left) (on J left)
      (top D left)
      (above D E) (above E F) (above F G) (above G H) (above H I) (above I J)
      (bottom J left)

      ; Middle peg final stack top->bottom A,B
      (on A middle) (on B middle)
      (top A middle)
      (above A B)
      (bottom B middle)

      ; Right peg final stack top->bottom C
      (on C right)
      (top C right)
      (bottom C right)
    )
  )
)