(define (problem Hanoi5Instance9)
  (:domain hanoi-domain)

  (:objects
    left middle right - peg
    A B C D E - disk
  )

  (:init
    ;; Initial stack on left: top -> bottom A B C D E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; Only the topmost disk and empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; Disk size ordering (static): A < B < C < D < E
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    ;; Goal tower on right: top -> bottom A B C D E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ;; left and middle pegs must be empty (no disk directly on them)
    (clear left)
    (clear middle)
  ))
)