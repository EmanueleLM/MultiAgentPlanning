(define (problem hanoi2agents15-instance19)
  (:domain hanoi_2agents_15)
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: A on B, B on C, ..., N on O, O on left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M N)
    (on N O)
    (on O left)

    ;; clear objects initially: top disk A, and the two empty pegs
    (clear A)
    (clear middle)
    (clear right)
  )

  (:goal
    (and
      ;; Goal configuration: left peg holds (top->bottom) C,D,E,F,G,H,I,J,K,L,M,N,O
      ;; middle peg holds A; right peg holds B.
      (on A middle)
      (on B right)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J K)
      (on K L)
      (on L M)
      (on M N)
      (on N O)
      (on O left)
    )
  )
)