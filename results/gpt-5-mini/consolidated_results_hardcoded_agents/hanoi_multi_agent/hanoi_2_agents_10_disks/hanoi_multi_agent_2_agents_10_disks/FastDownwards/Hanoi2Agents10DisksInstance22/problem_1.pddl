(define (problem Hanoi2Agents10DisksInstance22)
  (:domain hanoi-multiagent)
  (:objects
    ; disks
    A B C D E F G H I J - disk
    ; pegs
    left middle right - peg
    ; agents (declared for clarity)
    agent_1 agent_2 - agent
  )

  (:init
    ; initial stacking (direct-on relations): top->bottom
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

    ; clear objects: only the top disk A is clear, middle and right pegs are empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ; agent movement permissions (strict constraints)
    (can-move-agent1 A)
    (can-move-agent1 B)
    (can-move-agent1 C)
    (can-move-agent1 D)
    (can-move-agent1 E)

    (can-move-agent2 F)
    (can-move-agent2 G)
    (can-move-agent2 H)
    (can-move-agent2 I)
    (can-move-agent2 J)

    ; size relations: smaller < larger (complete partial order among disks)
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
    ; desired final stacking: left peg (top->bottom) A on C, C on E, E on F, F on G, G on H, H on I, I on J, J on left
    (on A C)
    (on C E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)
    ; D on middle, B on right
    (on D middle)
    (on B right)
  ))
)