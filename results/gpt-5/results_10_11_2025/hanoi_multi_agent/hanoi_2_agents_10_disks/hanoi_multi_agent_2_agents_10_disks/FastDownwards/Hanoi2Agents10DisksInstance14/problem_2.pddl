(define (problem Hanoi2Agents10DisksInstance14)
  (:domain hanoi-2agents-10disks)
  (:objects
    left middle right - peg
    A B C D E - disk_a_e
    F G H I J - disk_f_j
  )
  (:init
    (peg left) (peg middle) (peg right)
    (disk A) (disk B) (disk C) (disk D) (disk E)
    (disk F) (disk G) (disk H) (disk I) (disk J)

    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    (placeable A left) (placeable A middle) (placeable A right)
    (placeable A B) (placeable A C) (placeable A D) (placeable A E) (placeable A F) (placeable A G) (placeable A H) (placeable A I) (placeable A J)

    (placeable B left) (placeable B middle) (placeable B right)
    (placeable B C) (placeable B D) (placeable B E) (placeable B F) (placeable B G) (placeable B H) (placeable B I) (placeable B J)

    (placeable C left) (placeable C middle) (placeable C right)
    (placeable C D) (placeable C E) (placeable C F) (placeable C G) (placeable C H) (placeable C I) (placeable C J)

    (placeable D left) (placeable D middle) (placeable D right)
    (placeable D E) (placeable D F) (placeable D G) (placeable D H) (placeable D I) (placeable D J)

    (placeable E left) (placeable E middle) (placeable E right)
    (placeable E F) (placeable E G) (placeable E H) (placeable E I) (placeable E J)

    (placeable F left) (placeable F middle) (placeable F right)
    (placeable F G) (placeable F H) (placeable F I) (placeable F J)

    (placeable G left) (placeable G middle) (placeable G right)
    (placeable G H) (placeable G I) (placeable G J)

    (placeable H left) (placeable H middle) (placeable H right)
    (placeable H I) (placeable H J)

    (placeable I left) (placeable I middle) (placeable I right)
    (placeable I J)

    (placeable J left) (placeable J middle) (placeable J right)

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
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    (on A E)
    (on E middle)

    (on B C)
    (on C D)
    (on D right)
  ))
)