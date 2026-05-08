(define (problem Hanoi2Agents10DisksInstance24)
  (:domain hanoi-2agents-10)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    (peg left) (peg middle) (peg right)

    ;; initial stack: left peg top-to-bottom A,B,C,D,E,F,G,H,I,J
    (on A left) (on B left) (on C left) (on D left) (on E left)
    (on F left) (on G left) (on H left) (on I left) (on J left)

    (top left A)
    (above A B) (above B C) (above C D) (above D E)
    (above E F) (above F G) (above G H) (above H I) (above I J)

    (empty middle) (empty right)

    ;; agent permissions
    (can-move agent_1 A) (can-move agent_1 B) (can-move agent_1 C)
    (can-move agent_1 D) (can-move agent_1 E)
    (can-move agent_2 F) (can-move agent_2 G) (can-move agent_2 H)
    (can-move agent_2 I) (can-move agent_2 J)

    ;; size ordering (smaller x y means x is smaller than y)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller A G) (smaller A H) (smaller A I) (smaller A J)

    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller B G) (smaller B H) (smaller B I) (smaller B J)

    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller C H) (smaller C I) (smaller C J)

    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller D I) (smaller D J)

    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)

    (smaller F G) (smaller F H) (smaller F I) (smaller F J)

    (smaller G H) (smaller G I) (smaller G J)

    (smaller H I) (smaller H J)

    (smaller I J)
  )

  (:goal
    (and
      ;; left peg top-to-bottom: B D E F G H I J
      (top left B)
      (above B D) (above D E) (above E F) (above F G) (above G H) (above H I) (above I J)

      ;; middle: C
      (top middle C)

      ;; right: A
      (top right A)
    )
  )
)