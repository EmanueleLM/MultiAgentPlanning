(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    a b c d e f - disk
    left middle right - peg
  )

  (:init
    ;; size ordering: a smallest, f largest
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)

    ;; initial tower on left: top->bottom a,b,c,d,e,f
    ;; representation: a on b, b on c, c on d, d on e, e on f, f on left
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f left)

    ;; clear predicates: true for the top disk and for empty pegs
    (clear a)
    (clear middle)
    (clear right)

    ;; Ensure non-clear where appropriate (implicitly false where not listed).
    ;; Note: disks b..f and peg left are not clear initially.
  )

  (:goal
    (and
      ;; goal tower on right: top->bottom a,b,c,d,e,f
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e f)
      (on f right)
    )
  )
)