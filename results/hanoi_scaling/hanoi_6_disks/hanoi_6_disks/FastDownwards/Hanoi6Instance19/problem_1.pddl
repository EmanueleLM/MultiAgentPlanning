(define (problem Hanoi6Instance19)
  (:domain tower-of-hanoi)
  (:objects
    left middle right - peg
    a b c d e f - disk
  )

  (:init
    ;; size ordering (a smallest .. f largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)

    ;; initial stack on left: top -> a on b on c on d on e on f on left
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f left)

    ;; the topmost disk on the left peg is 'a'
    (top a left)

    ;; other pegs are empty initially
    (empty middle)
    (empty right)
  )

  (:goal (and
    ;; lawful order on right peg: a on b on c on d on e on f on right
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f right)
  ))
)