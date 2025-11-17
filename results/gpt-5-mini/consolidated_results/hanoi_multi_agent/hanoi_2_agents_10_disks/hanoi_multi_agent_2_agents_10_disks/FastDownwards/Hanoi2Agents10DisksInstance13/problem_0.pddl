(define (problem hanoi-multi-agent-problem)
  (:domain hanoi-multi-agent)
  (:objects
    A B C D E F G H I J - disk
    pegleft pegmiddle pegright - peg
  )

  (:init
    ;; Ownership of disks (agent move restrictions)
    (agent1disk A) (agent1disk B) (agent1disk C) (agent1disk D) (agent1disk E)
    (agent2disk F) (agent2disk G) (agent2disk H) (agent2disk I) (agent2disk J)

    ;; Size ordering: smaller X Y means X is strictly smaller than Y
    ;; A is smallest, J is largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ;; Initial stack on pegleft, top->bottom: A, B, C, D, E, F, G, H, I, J
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J pegleft)

    ;; Clear predicates: top disk A is clear; other disks are not clear initially.
    (clear A)
    ;; Pegs: pegmiddle and pegright are empty (clear), pegleft has disks on it so not declared clear
    (clear pegmiddle)
    (clear pegright)
  )

  (:goal
    (and
      ;; Goal stacks:
      ;; left peg top->bottom: A, B, D, E, F, G, H, I, J
      (on A B)
      (on B D)
      (on D E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J pegleft)

      ;; middle peg top->bottom: C
      (on C pegmiddle)
      (clear C)

      ;; right peg empty
      (clear pegright)
    )
  )
)