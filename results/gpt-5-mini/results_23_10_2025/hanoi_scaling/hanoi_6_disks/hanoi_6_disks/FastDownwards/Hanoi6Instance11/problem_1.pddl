(define (problem Hanoi6Instance11)
  (:domain hanoi6)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ; initial stack on left: top->bottom A B C D E F
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ; clear: top-of-stack and empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ; size ordering (A smallest ... F largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal
    (and
      ; goal: all disks stacked on right peg in same order top->bottom A B C D E F
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F right)
    )
  )
)