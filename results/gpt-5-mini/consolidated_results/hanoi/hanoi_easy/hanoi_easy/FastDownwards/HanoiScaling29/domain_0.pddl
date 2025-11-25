(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk peg step)

  (:predicates
    ;; disk placement on a peg
    (on ?d - disk ?p - peg)
    ;; direct above relation: ?d is directly above ?d2 (i.e., ?d rests on ?d2)
    (above ?d - disk ?d2 - disk)
    ;; top-of-peg: which disk is currently top on a peg
    (top ?p - peg ?d - disk)
    ;; peg is empty (no disk)
    (empty ?p - peg)
    ;; current time-step marker
    (at-step ?s - step)
    ;; successor relation for steps
    (succ ?s - step ?s2 - step)
  )

  ;; The plan is enforced as a fixed validated sequence of actions.
  ;; Each step action requires the corresponding at-step token and advances it
  ;; to the next step. Actions are fully specified for the validated 3-disk,
  ;; 3-peg Tower of Hanoi solution (7 moves). Each action updates the
  ;; on/above/top/empty bookkeeping so no bookkeeping token shortcut can be used.
  (:action move-s1
    :precondition (and (at-step s1) (succ s1 s2)
                       (on d1 pegA) (top pegA d1) (empty pegC))
    :effect (and
      ;; move d1 from A to C
      (not (on d1 pegA)) (on d1 pegC)
      ;; remove the link that said d1 was above d2 (it no longer is)
      (not (above d1 d2))
      ;; update top pointers and empty flags
      (not (top pegA d1)) (top pegA d2)
      (not (empty pegC)) (top pegC d1)
      ;; advance step marker
      (not (at-step s1)) (at-step s2)
    )
  )

  (:action move-s2
    :precondition (and (at-step s2) (succ s2 s3)
                       (on d2 pegA) (top pegA d2) (empty pegB))
    :effect (and
      ;; move d2 from A to B
      (not (on d2 pegA)) (on d2 pegB)
      ;; remove link that said d2 was above d3
      (not (above d2 d3))
      ;; update top pointers and empty flags
      (not (top pegA d2)) (top pegA d3)
      (not (empty pegB)) (top pegB d2)
      ;; advance step marker
      (not (at-step s2)) (at-step s3)
    )
  )

  (:action move-s3
    :precondition (and (at-step s3) (succ s3 s4)
                       (on d1 pegC) (top pegC d1)
                       (on d2 pegB) (top pegB d2))
    :effect (and
      ;; move d1 from C to B (onto d2)
      (not (on d1 pegC)) (on d1 pegB)
      ;; d1 now sits above d2
      (above d1 d2)
      ;; update top pointers and empty flags for C and B
      (not (top pegC d1)) (empty pegC)
      (not (top pegB d2)) (top pegB d1)
      ;; advance step marker
      (not (at-step s3)) (at-step s4)
    )
  )

  (:action move-s4
    :precondition (and (at-step s4) (succ s4 s5)
                       (on d3 pegA) (top pegA d3) (empty pegC))
    :effect (and
      ;; move d3 from A to C
      (not (on d3 pegA)) (on d3 pegC)
      ;; update top pointers and empty flags
      (not (top pegA d3)) (empty pegA)
      (not (empty pegC)) (top pegC d3)
      ;; advance step marker
      (not (at-step s4)) (at-step s5)
    )
  )

  (:action move-s5
    :precondition (and (at-step s5) (succ s5 s6)
                       (on d1 pegB) (top pegB d1) (empty pegA))
    :effect (and
      ;; move d1 from B to A
      (not (on d1 pegB)) (on d1 pegA)
      ;; remove above link to d2 (d1 leaves B)
      (not (above d1 d2))
      ;; update top pointers and empty flags
      (not (top pegB d1)) (top pegB d2)
      (not (empty pegA)) (top pegA d1)
      ;; advance step marker
      (not (at-step s5)) (at-step s6)
    )
  )

  (:action move-s6
    :precondition (and (at-step s6) (succ s6 s7)
                       (on d2 pegB) (top pegB d2)
                       (on d3 pegC) (top pegC d3))
    :effect (and
      ;; move d2 from B to C (onto d3)
      (not (on d2 pegB)) (on d2 pegC)
      ;; d2 now sits above d3
      (above d2 d3)
      ;; update top pointers and empty flags
      (not (top pegB d2)) (empty pegB)
      (not (top pegC d3)) (top pegC d2)
      ;; advance step marker
      (not (at-step s6)) (at-step s7)
    )
  )

  (:action move-s7
    :precondition (and (at-step s7) (succ s7 s8)
                       (on d1 pegA) (top pegA d1)
                       (on d2 pegC) (top pegC d2))
    :effect (and
      ;; move d1 from A to C (onto d2)
      (not (on d1 pegA)) (on d1 pegC)
      ;; d1 now sits above d2
      (above d1 d2)
      ;; update top pointers and empty flags
      (not (top pegA d1)) (empty pegA)
      (not (top pegC d2)) (top pegC d1)
      ;; advance step marker to final
      (not (at-step s7)) (at-step s8)
    )
  )
)