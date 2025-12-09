(define (problem hanoi-6-disks)
  (:domain hanoi-multiagent)

  ; Objects
  (:objects
    diskA diskB diskC diskD diskE diskF - disk
    left middle right - peg
  )

  ; Initial state: left peg contains the full stack from bottom (largest diskF) to top (smallest diskA).
  ; Assumption (explicit): diskA is the smallest, diskF is the largest (A < B < C < D < E < F).
  ; Stack on left (direct on relations):
  ;   diskA on diskB
  ;   diskB on diskC
  ;   diskC on diskD
  ;   diskD on diskE
  ;   diskE on diskF
  ;   diskF on left
  ; Top facts (clear) computed accordingly:
  ;   clear diskA = true (topmost)
  ;   clear diskB..diskF = false except when appropriate
  ;   left is not clear initially (has diskF)
  ;   middle and right are clear (empty)
  (:init
    ; stack on left (direct supports)
    (on diskA diskB)
    (on diskB diskC)
    (on diskC diskD)
    (on diskD diskE)
    (on diskE diskF)
    (on diskF left)

    ; clear predicates: only the top-most disk and empty pegs are clear at start
    (clear diskA)
    (not (clear diskB))
    (not (clear diskC))
    (not (clear diskD))
    (not (clear diskE))
    (not (clear diskF))

    (not (clear left))
    (clear middle)
    (clear right)

    ; no disk is being held initially
    ; (holding ...) absent by default

    ; idle initially true (no move in-progress)
    (idle)

    ; size ordering facts (static assumptions, explicitly enumerated to make comparisons exact)
    ; diskA < diskB < diskC < diskD < diskE < diskF
    (smaller diskA diskB)
    (smaller diskA diskC)
    (smaller diskA diskD)
    (smaller diskA diskE)
    (smaller diskA diskF)

    (smaller diskB diskC)
    (smaller diskB diskD)
    (smaller diskB diskE)
    (smaller diskB diskF)

    (smaller diskC diskD)
    (smaller diskC diskE)
    (smaller diskC diskF)

    (smaller diskD diskE)
    (smaller diskD diskF)

    (smaller diskE diskF)
  )

  ; Goal: all disks moved to the right peg preserving the same stack order (F bottom ... A top).
  ; Also require middle peg to be empty at goal (explicit constraint). All these are hard constraints.
  (:goal (and
    ; final stack on right: diskF directly on right, diskE on diskF, ..., diskA on diskB
    (on diskF right)
    (on diskE diskF)
    (on diskD diskE)
    (on diskC diskD)
    (on diskB diskC)
    (on diskA diskB)

    ; middle peg must be empty (explicit constraint)
    (clear middle)

    ; ensure top disk clear facts consistent with final stack (top is diskA)
    (clear diskA)
    (not (clear diskB))
    (not (clear diskC))
    (not (clear diskD))
    (not (clear diskE))
    (not (clear diskF))

    ; ensure there is no move left in-progress at the end
    (idle)

    ; ensure no disk is held at the end (implicit because (holding ...) facts would fail goal)
    ; we do not include any (holding ...) in the goal; if any disk is held, on facts would be violated.
    ; (No additional universal negation needed; the above on/clear/idle constraints fully fix the terminal conditions.)
  ))

  ; No metric specified; purely classical reachability.
)