(define (problem hanoi-10-A-right)
  (:domain hanoi-single)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )
  (:init
    ; smaller relations
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; placeable onto pegs (static legality)
    (placeable A left) (placeable A middle) (placeable A right)
    (placeable B left) (placeable B middle) (placeable B right)
    (placeable C left) (placeable C middle) (placeable C right)
    (placeable D left) (placeable D middle) (placeable D right)
    (placeable E left) (placeable E middle) (placeable E right)
    (placeable F left) (placeable F middle) (placeable F right)
    (placeable G left) (placeable G middle) (placeable G right)
    (placeable H left) (placeable H middle) (placeable H right)
    (placeable I left) (placeable I middle) (placeable I right)
    (placeable J left) (placeable J middle) (placeable J right)

    ; placeable onto strictly larger disks (static legality)
    (placeable A B) (placeable A C) (placeable A D) (placeable A E) (placeable A F) (placeable A G) (placeable A H) (placeable A I) (placeable A J)
    (placeable B C) (placeable B D) (placeable B E) (placeable B F) (placeable B G) (placeable B H) (placeable B I) (placeable B J)
    (placeable C D) (placeable C E) (placeable C F) (placeable C G) (placeable C H) (placeable C I) (placeable C J)
    (placeable D E) (placeable D F) (placeable D G) (placeable D H) (placeable D I) (placeable D J)
    (placeable E F) (placeable E G) (placeable E H) (placeable E I) (placeable E J)
    (placeable F G) (placeable F H) (placeable F I) (placeable F J)
    (placeable G H) (placeable G I) (placeable G J)
    (placeable H I) (placeable H J)
    (placeable I J)

    ; initial stack: left peg top->bottom A B C D E F G H I J
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

    ; initial clear statuses
    (clear A)
    (clear middle)
    (clear right)
  )
  (:goal (and
    ; right peg has A
    (on A right)
    (clear A)
    ; middle peg empty
    (clear middle)
    ; left peg has top->bottom B C D E F G H I J
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)
    (clear B)
  ))
)