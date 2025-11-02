(define (problem hanoi-7-problem)
  (:domain hanoi-7)
  (:objects
    left middle right - peg
    A B C D E F G - disk
  )

  (:init
    ;; type predicates (convenience, matching domain predicates)
    (peg left) (peg middle) (peg right)
    (disk A) (disk B) (disk C) (disk D) (disk E) (disk F) (disk G)

    ;; immediate supports (on_direct) - initial stack: A on B, B on C, C on D, D on E, E on F, F on G, G on peg left
    (on_direct A B)
    (on_direct B C)
    (on_direct C D)
    (on_direct D E)
    (on_direct E F)
    (on_direct F G)
    (on_direct G left)

    ;; on_stack: every disk is on peg left initially (transitive support)
    (on_stack A left)
    (on_stack B left)
    (on_stack C left)
    (on_stack D left)
    (on_stack E left)
    (on_stack F left)
    (on_stack G left)

    ;; top_of_peg: A is top on left
    (top_of_peg A left)

    ;; clear: which objects have nothing directly on them initially?
    ;; A has nothing on it; middle and right pegs are empty and hence clear.
    (clear A)
    (clear middle)
    (clear right)

    ;; empty pegs
    (empty middle)
    (empty right)

    ;; size ordering: smaller relations (A < B < C < D < E < F < G)
    ;; A smaller than B..G
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    ;; B smaller than C..G
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    ;; C smaller than D..G
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    ;; D smaller than E..G
    (smaller D E) (smaller D F) (smaller D G)
    ;; E smaller than F..G
    (smaller E F) (smaller E G)
    ;; F smaller than G
    (smaller F G)

    ;; Note: above relations are not enumerated here; they are derivable from on_direct but not required directly by actions.
  )

  (:goal (and
    ;; Goal: move all disks to the right peg (order maintained implicitly by allowed moves)
    (on_stack A right)
    (on_stack B right)
    (on_stack C right)
    (on_stack D right)
    (on_stack E right)
    (on_stack F right)
    (on_stack G right)
  ))
)