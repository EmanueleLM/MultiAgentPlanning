(define (problem Hanoi2Agents10DisksInstance6-problem)
  (:domain hanoi-2agents-10)
  (:objects
    A B C D E - disk_agent1
    F G H I J - disk_agent2
    left middle right - peg
  )

  (:init
    ;; initial stacking: A on B, B on C, ..., I on J, J on left peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on-peg J left)

    ;; top-of-stack markers
    (clear_disk A)
    (clear_peg middle)
    (clear_peg right)

    ;; size ordering (smaller x y means x is smaller than y)
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
    ;; left peg stack top->bottom: C, E, F, G, H, I, J
    (on C E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on-peg J left)

    ;; middle peg: B
    (on-peg B middle)

    ;; right peg top->bottom: A, D
    (on A D)
    (on-peg D right)
  )))