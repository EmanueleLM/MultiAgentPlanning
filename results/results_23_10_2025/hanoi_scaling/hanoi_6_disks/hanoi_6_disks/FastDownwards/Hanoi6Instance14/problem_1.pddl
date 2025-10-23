(define (problem hanoi6-instance14)
  (:domain hanoi6)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left: top A on B on C on D on E on F on left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ;; clear supports: top disk A, empty pegs middle and right
    (clear A)
    (clear middle)
    (clear right)

    ;; static size (smaller) relations: A smallest, F largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )
  (:goal (and
    ;; goal: all disks stacked on right in same order (top A ... bottom F)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F right)
  ))
)