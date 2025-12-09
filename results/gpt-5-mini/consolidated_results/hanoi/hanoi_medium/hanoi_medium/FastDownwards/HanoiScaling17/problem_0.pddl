(define (problem hanoi-3disks-multiagent)
  (:domain hanoi-multiagent)
  (:objects
    d1 d2 d3 - disk
    left mid right - peg
    a1 a2 - agent
    p1 p2 p3 p4 p5 p6 p7 p8 - phase
  )

  (:init
    ;; Initial tower configuration (all disks stacked on left peg: d3 bottom, d2 middle, d1 top)
    (on d3 left)
    (on d2 d3)
    (on d1 d2)

    ;; Clear status: only the top disk is clear; pegs mid and right are empty & clear
    (clear d1)
    (not (clear d2)) ; negative-precondition annotations are not used in :init, but this documents the intended state
    (not (clear d3))

    (clear mid)
    (clear right)
    (not (clear left))

    ;; Peg emptiness
    (empty mid)
    (empty right)
    ;; left is not empty initially (there are disks on it)

    ;; Disk size ordering (static)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d2 d3)

    ;; Agents
    (agent a1)
    (agent a2)

    ;; Phase sequencing: enforce an explicit ordered sequence of exactly 7 moves, one per phase transition
    (current-phase p1)
    (next p1 p2)
    (next p2 p3)
    (next p3 p4)
    (next p4 p5)
    (next p5 p6)
    (next p6 p7)
    (next p7 p8)
  )

  (:goal (and
    ;; Terminal conditions mandated: final phase reached and left peg empty,
    ;; and all disks stacked on the right peg in correct order (d3 bottom, d2 middle, d1 top).
    (current-phase p8)
    (empty left)
    (on d3 right)
    (on d2 d3)
    (on d1 d2)
  ))