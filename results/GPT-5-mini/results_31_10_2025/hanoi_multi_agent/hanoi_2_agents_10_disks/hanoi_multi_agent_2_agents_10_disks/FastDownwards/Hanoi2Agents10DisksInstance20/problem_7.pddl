(define (problem Hanoi2Agents10DisksInstance20)
  (:domain hanoi2agents_hardcoded)

  (:init
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    (at-step step0)
  )

  (:goal (and
    (on B left)
    (on E B)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    (on A middle)

    (on C right)
    (on D C)
  ))
)