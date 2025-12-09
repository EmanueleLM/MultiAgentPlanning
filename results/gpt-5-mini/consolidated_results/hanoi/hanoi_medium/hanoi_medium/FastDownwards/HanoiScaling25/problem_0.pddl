(define (problem hanoi-5-instance)
  (:domain tower-of-hanoi-5)

  ;; Objects: five real disks d1..d5 (d1 is smallest), and one base disk per peg.
  (:objects
    d1 d2 d3 d4 d5 baseA baseB baseC - disk
    pegA pegB pegC                   - peg
  )

  ;; Initial state:
  ;; - All disk and peg typing facts (optional but explicit).
  ;; - Base disks are immovable and sit on their pegs.
  ;; - Initial stack on pegA: baseA (bottom) <- d5 <- d4 <- d3 <- d2 <- d1 (top).
  ;; - PegB and PegC start empty except for their immovable bases.
  ;; - top facts reflect which disk is currently top on each peg (bases if peg empty).
  (:init
    ;;; typing facts
    (disk d1) (disk d2) (disk d3) (disk d4) (disk d5)
    (disk baseA) (disk baseB) (disk baseC)
    (peg pegA) (peg pegB) (peg pegC)

    ;;; immovable bases are placed on their pegs
    (immovable baseA) (immovable baseB) (immovable baseC)
    (on-peg baseA pegA)
    (on-peg baseB pegB)
    (on-peg baseC pegC)

    ;;; initial stacking on pegA (bottom to top): baseA <- d5 <- d4 <- d3 <- d2 <- d1
    (on-disk d5 baseA)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;;; tops: pegA top is d1, pegB and pegC tops are their bases (empty pegs)
    (top pegA d1)
    (top pegB baseB)
    (top pegC baseC)

    ;;; size ordering: smaller di dj for all i < j, and all real disks are smaller than any base
    ;; real disk size relations among themselves
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)

    ;; real disks are smaller than each base disk (bases are modeling sentinels larger than all)
    (smaller d1 baseA) (smaller d1 baseB) (smaller d1 baseC)
    (smaller d2 baseA) (smaller d2 baseB) (smaller d2 baseC)
    (smaller d3 baseA) (smaller d3 baseB) (smaller d3 baseC)
    (smaller d4 baseA) (smaller d4 baseB) (smaller d4 baseC)
    (smaller d5 baseA) (smaller d5 baseB) (smaller d5 baseC)
  )

  ;; Goal:
  ;; - All five real disks stacked on pegC in the same order (baseC at bottom), and
  ;;   top-of-peg relationships fixed: pegC top is d1, pegA and pegB remain with their base tops.
  ;; The goal explicitly fixes the mandated terminal configuration so no auxiliary bookkeeping
  ;; is required to verify success.
  (:goal (and
    ;; stack on pegC: baseC <- d5 <- d4 <- d3 <- d2 <- d1 (direct on-disk links)
    (on-disk d5 baseC)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; top facts: pegC top is d1; pegA and pegB tops are their bases
    (top pegC d1)
    (top pegA baseA)
    (top pegB baseB)
  ))
)