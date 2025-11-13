(define (problem hanoi-10-2agents-problem)
  (:domain hanoi-10-2agents)
  (:objects
    peg1 peg2 peg3 - peg
    A B C D E - disk_a_e
    F G H I J - disk_f_j
  )
  (:init
    ; classify objects
    (peg peg1) (peg peg2) (peg peg3)
    (disk A) (disk B) (disk C) (disk D) (disk E)
    (disk F) (disk G) (disk H) (disk I) (disk J)

    ; size ordering: A smallest ... J largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; allowed placements: any disk onto any peg, or onto any larger disk
    (placeable A peg1) (placeable A peg2) (placeable A peg3)
    (placeable A B) (placeable A C) (placeable A D) (placeable A E) (placeable A F) (placeable A G) (placeable A H) (placeable A I) (placeable A J)

    (placeable B peg1) (placeable B peg2) (placeable B peg3)
    (placeable B C) (placeable B D) (placeable B E) (placeable B F) (placeable B G) (placeable B H) (placeable B I) (placeable B J)

    (placeable C peg1) (placeable C peg2) (placeable C peg3)
    (placeable C D) (placeable C E) (placeable C F) (placeable C G) (placeable C H) (placeable C I) (placeable C J)

    (placeable D peg1) (placeable D peg2) (placeable D peg3)
    (placeable D E) (placeable D F) (placeable D G) (placeable D H) (placeable D I) (placeable D J)

    (placeable E peg1) (placeable E peg2) (placeable E peg3)
    (placeable E F) (placeable E G) (placeable E H) (placeable E I) (placeable E J)

    (placeable F peg1) (placeable F peg2) (placeable F peg3)
    (placeable F G) (placeable F H) (placeable F I) (placeable F J)

    (placeable G peg1) (placeable G peg2) (placeable G peg3)
    (placeable G H) (placeable G I) (placeable G J)

    (placeable H peg1) (placeable H peg2) (placeable H peg3)
    (placeable H I) (placeable H J)

    (placeable I peg1) (placeable I peg2) (placeable I peg3)
    (placeable I J)

    (placeable J peg1) (placeable J peg2) (placeable J peg3)

    ; initial stack: all disks on peg1, A smallest/top ... J largest/bottom
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J peg1)

    ; clear supports at start
    (clear A)
    (clear peg2)
    (clear peg3)

    ; optional top annotation (not required by actions)
    (top A peg1)
  )
  (:goal (and
    ; target stack: all disks on peg3 in correct order
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J peg3)

    ; final clear supports
    (clear A)
    (clear peg1)
    (clear peg2)
  ))
)