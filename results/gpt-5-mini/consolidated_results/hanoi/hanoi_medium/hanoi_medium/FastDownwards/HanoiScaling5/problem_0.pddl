(define (problem hanoi-5-problem)
  (:domain hanoi-5)

  (:objects
    ;; disks: d1 is smallest, d5 is largest
    d1 d2 d3 d4 d5 - disk

    ;; three pegs: left, middle, right
    left mid right - peg

    ;; positions pos0..pos5: pos0 denotes empty peg (no disks),
    ;; pos1 is bottom slot, pos5 is top slot for a 5-disk puzzle
    pos0 pos1 pos2 pos3 pos4 pos5 - pos
  )

  (:init
    ;; initial stacking: all disks on the right peg
    ;; bottom (pos1) -> largest d5, up to top (pos5) -> smallest d1
    (at d5 right pos1)
    (at d4 right pos2)
    (at d3 right pos3)
    (at d2 right pos4)
    (at d1 right pos5)

    ;; initial top indices for pegs: left and mid empty (pos0), right top is pos5
    (top left pos0)
    (top mid pos0)
    (top right pos5)

    ;; successor relations for positions
    (succ pos0 pos1) (succ pos1 pos2) (succ pos2 pos3)
    (succ pos3 pos4) (succ pos4 pos5)

    ;; predecessor relations (inverse of succ)
    (pred pos0 pos0) ;; define pred of pos0 as pos0 for convenience when empty
    (pred pos0 pos1) ;; not used semantically; kept for explicitness (pos0 -> pos0 is tolerated)
    (pred pos1 pos2) (pred pos2 pos3) (pred pos3 pos4) (pred pos4 pos5)
    ;; The above pred facts reflect a simple predecessor relation used by actions.
    ;; To produce correct updates the planner will use the appropriate pred pairs
    ;; passed as parameters; explicit pairs for all needed pred relationships are included below:
    (pred pos1 pos1) (pred pos2 pos2) (pred pos3 pos3) (pred pos4 pos4) (pred pos5 pos5)
    ;; (Note: pred pairs are enumerated so that each position can be used as a pred parameter;
    ;;  the move actions consult (pred ?predi ?i) where ?predi is expected to be the predecessor of ?i.)

    ;; To be explicit and unambiguous, enumerate exact predecessor-of relations:
    ;; predecessor of pos1 is pos0, predecessor of pos2 is pos1, ..., predecessor of pos5 is pos4
    (pred pos0 pos1)
    (pred pos1 pos2)
    (pred pos2 pos3)
    (pred pos3 pos4)
    (pred pos4 pos5)

    ;; size ordering: smaller(d_i, d_j) iff disk i is smaller than disk j
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)
  )

  (:goal
    (and
      ;; all disks stacked on the left peg in correct positions:
      (at d5 left pos1)
      (at d4 left pos2)
      (at d3 left pos3)
      (at d2 left pos4)
      (at d1 left pos5)

      ;; left peg top must be pos5 (full stack) and other pegs empty
      (top left pos5)
      (top mid pos0)
      (top right pos0)
    )
  )
)