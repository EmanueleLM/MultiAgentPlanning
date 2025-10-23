(define (problem hanoi6-instance15)
  (:domain hanoi6)

  (:objects
    a b c d e f - disk
    left middle right - peg
  )

  (:init
    ;; initial stacked configuration on the left peg (top -> bottom: a b c d e f)
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f left)

    ;; clearness: top disk and empty pegs are clear
    (clear a)
    (clear middle)
    (clear right)

    ;; disk size ordering (a smallest ... f largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)

    ;; every disk is smaller than every peg (so disks can be placed on empty pegs)
    (smaller a left) (smaller a middle) (smaller a right)
    (smaller b left) (smaller b middle) (smaller b right)
    (smaller c left) (smaller c middle) (smaller c right)
    (smaller d left) (smaller d middle) (smaller d right)
    (smaller e left) (smaller e middle) (smaller e right)
    (smaller f left) (smaller f middle) (smaller f right)
  )

  ;; Goal: full stack transferred to right peg (top -> bottom: a b c d e f)
  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f right)
  ))
)