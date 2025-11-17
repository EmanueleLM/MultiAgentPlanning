(define (problem hanoi-10disks-agents)
  (:domain hanoi-3peg-agents)

  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ; initial stack (top -> bottom): A,B,C,D,E,F,G,H,I,J on left
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-peg  J left)

    ; clear predicates: top disk A is clear, middle and right pegs empty
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ; agent permissions
    (agent1-disk A)
    (agent1-disk B)
    (agent1-disk C)
    (agent1-disk D)
    (agent1-disk E)

    (agent2-disk F)
    (agent2-disk G)
    (agent2-disk H)
    (agent2-disk I)
    (agent2-disk J)

    ; size relations: X smaller than Y for all X strictly smaller than Y
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
    ; left peg top->bottom: B, E, F, G, H, I, J  -> B on E, E on F, ... , J on left
    (on-disk B E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-peg J left)

    ; middle peg has D
    (on-peg D middle)

    ; right peg top->bottom: A, C  -> A on C, C on right
    (on-disk A C)
    (on-peg C right)
  ))
)