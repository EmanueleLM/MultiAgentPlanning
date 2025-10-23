(define (problem hanoi6-problem)
  (:domain hanoi-6)

  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; stack encoded as direct-on relations (top -> immediate below)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ;; clear facts: top-most disk and empty pegs
    (clear A)
    (clear middle)
    (clear right)

    ;; size relations between disks (A smallest ... F largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    ;; every disk is smaller than each peg (pegs act as larger supports)
    (smaller A left) (smaller A middle) (smaller A right)
    (smaller B left) (smaller B middle) (smaller B right)
    (smaller C left) (smaller C middle) (smaller C right)
    (smaller D left) (smaller D middle) (smaller D right)
    (smaller E left) (smaller E middle) (smaller E right)
    (smaller F left) (smaller F middle) (smaller F right)
  )

  (:goal
    (and
      ;; goal stack on right (top->below)
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F right)
    )
  )
)