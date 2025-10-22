(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    a b c d e - disk
    left middle right - peg
  )

  (:init
    ;; Initial tower on the left peg, top->bottom: a b c d e
    ;; Represented as immediate-on relations: a on b, b on c, c on d, d on e, e on left peg
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e left)

    ;; Clear predicates: only the topmost disk (a) is clear; left peg is not clear; middle & right are clear
    (clear-disk a)
    ;; b, c, d, e are not clear initially (no explicit negated facts required in :init)
    (clear-peg middle)
    (clear-peg right)
    ;; left peg is not clear (because e is on it) -- represented by absence of (clear-peg left)

    ;; Size ordering (smaller x y) for five disks A..E with a smallest, e largest
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal
    (and
      ;; Goal: entire tower moved to the right peg, top->bottom: a b c d e
      (on-disk a b)
      (on-disk b c)
      (on-disk c d)
      (on-disk d e)
      (on-peg e right)

      ;; Left and middle pegs empty
      (clear-peg left)
      (clear-peg middle)
    )
  )
)