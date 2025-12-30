(define (problem Hanoi6Disks)
  (:domain hanoi-6-disks)
  (:objects
    a b c d e f - disk ; A smallest, F largest
    r m l - peg        ; R=Right (Initial), M=Middle, L=Left (Goal)
  )
  (:init
    ; --- Static Size Hierarchy (A < B < C < D < E < F) ---
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)

    ; --- Initial Configuration: A/B/C/D/E/F on R (Top to Bottom) ---
    (handempty)
    (clear_disk a)
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on_peg f r)

    ; Empty pegs
    (clear_peg m)
    (clear_peg l)

    (= (total-cost) 0)
  )

  (:goal (and
    ; Target Configuration on Left Peg (L)
    ; A/B/C/D/E/F (Top to Bottom)
    (clear_disk a)
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on_peg f l)

    ; Required terminal conditions: R and M must be empty
    (clear_peg r)
    (clear_peg m)
  ))
  (:metric minimize (total-cost))
)