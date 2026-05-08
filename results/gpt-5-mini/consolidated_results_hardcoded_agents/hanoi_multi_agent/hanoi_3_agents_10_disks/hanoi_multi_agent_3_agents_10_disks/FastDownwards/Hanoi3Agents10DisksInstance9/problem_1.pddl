(define (problem hanoi_instance)
  (:domain hanoi_multiagent)

  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ;; all disks initially on left (A top ... J bottom)
    (on A left) (on B left) (on C left) (on D left) (on E left)
    (on F left) (on G left) (on H left) (on I left) (on J left)

    ;; top/bottom/above relations on left
    (top left A)
    (above A B) (above B C) (above C D) (above D E) (above E F)
    (above F G) (above G H) (above H I) (above I J)
    (bottom left J)

    ;; other pegs empty
    (empty middle)
    (empty right)

    ;; agent permissions
    (agent1_can_move A) (agent1_can_move B) (agent1_can_move C) (agent1_can_move D)
    (agent2_can_move E) (agent2_can_move F) (agent2_can_move G)
    (agent3_can_move H) (agent3_can_move I) (agent3_can_move J)

    ;; size ordering A < B < C < D < E < F < G < H < I < J
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
    ;; Left peg: top-to-bottom D, E, F, G, H, I, J
    (top left D)
    (above D E) (above E F) (above F G) (above G H) (above H I) (above I J)
    (bottom left J)
    (on D left) (on E left) (on F left) (on G left) (on H left) (on I left) (on J left)

    ;; Middle peg: top-to-bottom A, C
    (top middle A) (above A C) (bottom middle C)
    (on A middle) (on C middle)

    ;; Right peg: single disk B
    (top right B) (bottom right B) (on B right)
  ))
)