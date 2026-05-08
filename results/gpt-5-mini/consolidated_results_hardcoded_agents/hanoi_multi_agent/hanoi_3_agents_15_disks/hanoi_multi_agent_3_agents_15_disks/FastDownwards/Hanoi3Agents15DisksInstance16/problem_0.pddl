(define (problem multi-agent-hanoi-problem)
  (:domain multi-agent-hanoi)

  (:objects
    ;; pegs (names taken from the environment)
    peg1 peg2 peg3 pegA pegB pegC - object

    ;; disks (A..O)
    A B C D E F G H I J K L M N O - object
  )

  (:init
    ;; Ownership: which agent may move which disk
    ;; Agent 1 disks: A..E
    (a-disk A) (a-disk B) (a-disk C) (a-disk D) (a-disk E)
    ;; Agent 2 disks: F..J
    (b-disk F) (b-disk G) (b-disk H) (b-disk I) (b-disk J)
    ;; Agent 3 disks: K..O
    (c-disk K) (c-disk L) (c-disk M) (c-disk N) (c-disk O)

    ;; Initial stacks encoded exactly as implied by the agent move lists:
    ;; Agent 1: all disks A (smallest) .. E (largest) start on peg1 in order
    ;; A on B, B on C, C on D, D on E, E on peg1
    (a-on A B)
    (a-on B C)
    (a-on C D)
    (a-on D E)
    (a-on E peg1)
    ;; only the top (A) is clear for agent1 initially; peg2 and peg3 are clear
    (a-clear A)
    (a-clear peg2)
    (a-clear peg3)

    ;; Agent 2: all disks F..J start on peg1 in order (F top)
    (b-on F G)
    (b-on G H)
    (b-on H I)
    (b-on I J)
    (b-on J peg1)
    (b-clear F)
    (b-clear peg2)
    (b-clear peg3)

    ;; Agent 3: all disks O (smallest) .. K (largest) start on pegA (O top)
    (c-on O N)
    (c-on N M)
    (c-on M L)
    (c-on L K)
    (c-on K pegA)
    (c-clear O)
    (c-clear pegB)
    (c-clear pegC)

    ;; Size order declarations (strict ordering) per agent matching the sequences.
    ;; Agent1 sizes: A < B < C < D < E
    (a-smaller A B) (a-smaller A C) (a-smaller A D) (a-smaller A E)
    (a-smaller B C) (a-smaller B D) (a-smaller B E)
    (a-smaller C D) (a-smaller C E)
    (a-smaller D E)

    ;; Agent2 sizes: F < G < H < I < J
    (b-smaller F G) (b-smaller F H) (b-smaller F I) (b-smaller F J)
    (b-smaller G H) (b-smaller G I) (b-smaller G J)
    (b-smaller H I) (b-smaller H J)
    (b-smaller I J)

    ;; Agent3 sizes: O < N < M < L < K  (O smallest, K largest)
    (c-smaller O N) (c-smaller O M) (c-smaller O L) (c-smaller O K)
    (c-smaller N M) (c-smaller N L) (c-smaller N K)
    (c-smaller M L) (c-smaller M K)
    (c-smaller L K)
  )

  (:goal
    (and
      ;; Agent1 goal: move stack A..E from peg1 to peg3 preserving order
      (a-on A B)
      (a-on B C)
      (a-on C D)
      (a-on D E)
      (a-on E peg3)
      (a-clear A)

      ;; Agent2 goal: move stack F..J from peg1 to peg3 preserving order
      (b-on F G)
      (b-on G H)
      (b-on H I)
      (b-on I J)
      (b-on J peg3)
      (b-clear F)

      ;; Agent3 goal: move stack O..K from pegA to pegC preserving order
      (c-on O N)
      (c-on N M)
      (c-on M L)
      (c-on L K)
      (c-on K pegC)
      (c-clear O)
    )
  )
)