(define (problem hanoi-8)
  (:domain hanoi)
  (:objects
    A B C D E F G H   - disk
    left middle right - peg
  )

  (:init
    ;; type facts
    (disk A) (disk B) (disk C) (disk D) (disk E) (disk F) (disk G) (disk H)
    (peg left) (peg middle) (peg right)

    ;; size ordering: smaller X Y if size(X) < size(Y)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)

    ;; Initial stack on left: top -> bottom A, B, C, D, E, F, G, H
    ;; We use on(X,Y) meaning X is directly on Y (Y is below X).
    ;; To represent top->bottom A,B,C,..., we encode:
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H left)

    ;; clear means no disk immediately on top of that object
    (clear A)
    (not (clear B))   ; implicit: not listed means false; kept here as comment for clarity
    ;; middle and right are empty pegs
    (clear middle) (clear right)
    (empty middle) (empty right)
    ;; left is not empty and not clear (because H is directly on left)
    ;; (not (empty left)) implicit
  )

  (:goal (and
    ;; goal: all disks stacked on right in same order top->bottom A,B,C,...H
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H right)
    ;; pegs left and middle empty
    (empty left)
    (empty middle)
  ))
)