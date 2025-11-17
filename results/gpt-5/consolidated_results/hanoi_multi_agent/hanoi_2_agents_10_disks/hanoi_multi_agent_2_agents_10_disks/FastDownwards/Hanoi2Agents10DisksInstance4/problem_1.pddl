(define (problem Hanoi2Agents10DisksInstance4)
  (:domain hanoi-10-2agents)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
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

    ; initial stack: left has A(top) ... J(bottom), middle empty, right empty
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
    ; left peg: B(top) E F G H I J(bottom)
    (on B E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)
    (clear B)

    ; middle peg: A(top) C D(bottom)
    (on A C)
    (on C D)
    (on D middle)
    (clear A)

    ; right peg empty
    (clear right)
  ))
)