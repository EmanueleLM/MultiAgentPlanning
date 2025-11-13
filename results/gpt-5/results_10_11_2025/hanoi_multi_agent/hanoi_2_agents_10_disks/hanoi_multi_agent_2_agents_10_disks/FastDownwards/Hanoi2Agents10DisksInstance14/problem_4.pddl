(define (problem Hanoi2Agents10DisksInstance14)
  (:domain hanoi-2agents-10disks)
  (:objects
    left middle right - peg
    A B C D E - disk_a_e
    F G H I J - disk_f_j
  )
  (:init
    ; typing predicates
    (peg left) (peg middle) (peg right)
    (disk A) (disk B) (disk C) (disk D) (disk E)
    (disk F) (disk G) (disk H) (disk I) (disk J)

    ; size ordering
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; initial stack (top to bottom on left)
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

    ; clears
    (clear A)
    (clear middle)
    (clear right)

    ; top of pegs
    (top A left)
  )
  (:goal (and
    ; left peg: F,G,H,I,J with F on top
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)
    (top F left)

    ; middle peg: A on E with A on top
    (on A E)
    (on E middle)
    (top A middle)

    ; right peg: B,C,D with B on top
    (on B C)
    (on C D)
    (on D right)
    (top B right)
  ))
)