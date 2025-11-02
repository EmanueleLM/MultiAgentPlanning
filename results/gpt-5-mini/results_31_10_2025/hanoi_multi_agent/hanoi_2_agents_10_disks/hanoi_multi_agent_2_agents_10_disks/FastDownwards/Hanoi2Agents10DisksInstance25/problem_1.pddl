(define (problem hanoi2agents10_instance25)
  (:domain hanoi_multiagent10)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )
  (:init
    ;; Initial stack on left: (top->bottom) A, B, C, D, E, F, G, H, I, J
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

    ;; Clear tops
    (clear A)
    (clear middle)
    (clear right)

    ;; Agent movement capabilities
    (can_move_by_agent1 A)
    (can_move_by_agent1 B)
    (can_move_by_agent1 C)
    (can_move_by_agent1 D)
    (can_move_by_agent1 E)

    (can_move_by_agent2 F)
    (can_move_by_agent2 G)
    (can_move_by_agent2 H)
    (can_move_by_agent2 I)
    (can_move_by_agent2 J)

    ;; Size relations: each smaller disk is smaller than every larger disk
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ;; Allow moves onto any empty peg (disks are smaller than pegs)
    (smaller A left) (smaller A middle) (smaller A right)
    (smaller B left) (smaller B middle) (smaller B right)
    (smaller C left) (smaller C middle) (smaller C right)
    (smaller D left) (smaller D middle) (smaller D right)
    (smaller E left) (smaller E middle) (smaller E right)
    (smaller F left) (smaller F middle) (smaller F right)
    (smaller G left) (smaller G middle) (smaller G right)
    (smaller H left) (smaller H middle) (smaller H right)
    (smaller I left) (smaller I middle) (smaller I right)
    (smaller J left) (smaller J middle) (smaller J right)
  )

  (:goal (and
    ;; Left peg final stack (top->bottom): D, E, F, G, H, I, J
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ;; Middle peg final stack (top->bottom): A, B, C
    (on A B)
    (on B C)
    (on C middle)

    ;; Right peg empty (implicitly ensured by configuration above and clear facts if needed)
  ))
)