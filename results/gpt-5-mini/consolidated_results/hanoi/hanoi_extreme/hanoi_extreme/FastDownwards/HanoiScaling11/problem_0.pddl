(define (problem hanoi7-problem)
  (:domain hanoi7)
  (:objects
    diskA diskB diskC diskD diskE diskF diskG - disk
    left mid right - peg
  )
  (:init
    ;; initial stack on peg mid (bottom to top: G F E D C B A)
    (on diskG mid)
    (on diskF diskG)
    (on diskE diskF)
    (on diskD diskE)
    (on diskC diskD)
    (on diskB diskC)
    (on diskA diskB)

    ;; clear predicates: top diskA is clear; left and right pegs are empty (clear)
    (clear diskA)
    (clear left)
    (clear right)
    ;; mid is not clear (has diskG at bottom with other disks above it), and
    ;; diskB..diskG are not clear (they have a disk on top), so we do not assert them.

    ;; smaller facts: disk ordering A < B < C < D < E < F < G (A is smallest)
    ;; disk-to-disk
    (smaller diskA diskB)
    (smaller diskA diskC)
    (smaller diskA diskD)
    (smaller diskA diskE)
    (smaller diskA diskF)
    (smaller diskA diskG)

    (smaller diskB diskC)
    (smaller diskB diskD)
    (smaller diskB diskE)
    (smaller diskB diskF)
    (smaller diskB diskG)

    (smaller diskC diskD)
    (smaller diskC diskE)
    (smaller diskC diskF)
    (smaller diskC diskG)

    (smaller diskD diskE)
    (smaller diskD diskF)
    (smaller diskD diskG)

    (smaller diskE diskF)
    (smaller diskE diskG)

    (smaller diskF diskG)

    ;; every disk is considered smaller than each peg (so placing any disk onto an empty peg is allowed)
    (smaller diskA left) (smaller diskA mid) (smaller diskA right)
    (smaller diskB left) (smaller diskB mid) (smaller diskB right)
    (smaller diskC left) (smaller diskC mid) (smaller diskC right)
    (smaller diskD left) (smaller diskD mid) (smaller diskD right)
    (smaller diskE left) (smaller diskE mid) (smaller diskE right)
    (smaller diskF left) (smaller diskF mid) (smaller diskF right)
    (smaller diskG left) (smaller diskG mid) (smaller diskG right)
  )

  (:goal (and
    ;; final stack on peg right (bottom to top: G F E D C B A)
    (on diskG right)
    (on diskF diskG)
    (on diskE diskF)
    (on diskD diskE)
    (on diskC diskD)
    (on diskB diskC)
    (on diskA diskB)

    ;; ensure the other pegs are empty at the goal
    (clear left)
    (clear mid)

    ;; top disk at goal is clear
    (clear diskA)
  ))
)