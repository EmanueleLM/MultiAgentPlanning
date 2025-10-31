(define (problem Hanoi8Instance4)
  (:domain hanoi)
  (:objects
    A B C D E F G H - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left: top -> bottom A, B, C, D, E, F, G, H
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H left)

    ;; clear facts: top elements and empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: smaller X Y if size(X) < size(Y)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )

  (:goal (and
    ;; All disks stacked on right in same order top->bottom A,B,C,D,E,F,G,H
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H right)

    ;; No disk remains on left or middle (enumerated negative facts)
    (not (on A left))  (not (on B left))  (not (on C left))  (not (on D left))
    (not (on E left))  (not (on F left))  (not (on G left))  (not (on H left))

    (not (on A middle)) (not (on B middle)) (not (on C middle)) (not (on D middle))
    (not (on E middle)) (not (on F middle)) (not (on G middle)) (not (on H middle))
  ))
)