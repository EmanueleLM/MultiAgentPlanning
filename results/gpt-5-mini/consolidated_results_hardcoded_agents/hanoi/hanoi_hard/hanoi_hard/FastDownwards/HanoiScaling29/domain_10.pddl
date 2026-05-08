(define (domain tower-of-hanoi-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg slot stage)

  (:predicates
    (in ?d - disk ?s - slot)                     ; disk ?d is in slot ?s
    (occupied ?s - slot)                         ; slot ?s contains a disk
    (top ?s - slot)                              ; slot ?s is the top occupied slot of its peg
    (slot-of ?s - slot ?p - peg)                 ; slot ?s belongs to peg ?p
    (above ?s_above - slot ?s_below - slot)      ; immediate-above relation: s_above is directly above s_below
    (bottom ?s - slot ?p - peg)                  ; slot ?s is the bottom slot of peg ?p
    (peg-empty ?p - peg)                         ; peg ?p currently has no disks
    (smaller ?small - disk ?large - disk)        ; disk ordering: ?small is smaller than ?large
    (same ?p1 - peg ?p2 - peg)                   ; identity helper for preventing same-peg moves
    (cur-stage ?t - stage)                       ; current stage/time marker
    (succ ?t1 - stage ?t2 - stage)               ; successor relation between stages
  )

  ;; Move top disk from a source peg where source has at least one slot below (non-bottom)
  ;; onto an empty destination peg (destination bottom slot unoccupied).
  (:action move_from_with_below_to_empty
    :parameters (?d - disk
                 ?s_from - slot ?s_below - slot
                 ?p_from - peg
                 ?p_to - peg
                 ?s_to - slot
                 ?st - stage ?stnext - stage)
    :precondition (and
      (in ?d ?s_from)
      (top ?s_from)
      (above ?s_from ?s_below)
      (occupied ?s_below)
      (slot-of ?s_from ?p_from)
      (slot-of ?s_below ?p_from)

      (slot-of ?s_to ?p_to)
      (bottom ?s_to ?p_to)
      (peg-empty ?p_to)

      (not (same ?p_from ?p_to))

      (cur-stage ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      ;; move disk facts
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      ;; slot occupancy updated
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; top flags updated on source and destination
      (not (top ?s_from))
      (top ?s_below)
      (top ?s_to)

      ;; pegs empty flags updated
      (not (peg-empty ?p_to))

      ;; advance stage
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

  ;; Move top disk from a source peg whose top slot is also the bottom (single-disk peg),
  ;; to an empty destination peg.
  (:action move_from_bottom_to_empty
    :parameters (?d - disk
                 ?s_from - slot
                 ?p_from - peg
                 ?p_to - peg
                 ?s_to - slot
                 ?st - stage ?stnext - stage)
    :precondition (and
      (in ?d ?s_from)
      (top ?s_from)
      (bottom ?s_from ?p_from)
      (slot-of ?s_from ?p_from)

      (slot-of ?s_to ?p_to)
      (bottom ?s_to ?p_to)
      (peg-empty ?p_to)

      (not (same ?p_from ?p_to))

      (cur-stage ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      ;; move disk facts
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      ;; slot occupancy updated
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; top flags and peg-empty flags updated
      (not (top ?s_from))
      (peg-empty ?p_from)

      (top ?s_to)
      (not (peg-empty ?p_to))

      ;; advance stage
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

  ;; Move top disk from a source peg where source has at least one slot below (non-bottom)
  ;; onto a non-empty destination peg (place above current top of destination).
  (:action move_from_with_below_to_nonempty
    :parameters (?d - disk
                 ?s_from - slot ?s_below_src - slot
                 ?p_from - peg
                 ?p_to - peg
                 ?s_target_top - slot
                 ?s_to - slot
                 ?d_target - disk
                 ?st - stage ?stnext - stage)
    :precondition (and
      (in ?d ?s_from)
      (top ?s_from)
      (above ?s_from ?s_below_src)
      (occupied ?s_below_src)
      (slot-of ?s_from ?p_from)
      (slot-of ?s_below_src ?p_from)

      (slot-of ?s_target_top ?p_to)
      (slot-of ?s_to ?p_to)
      (top ?s_target_top)
      (above ?s_to ?s_target_top)
      (not (occupied ?s_to))
      (in ?d_target ?s_target_top)
      (smaller ?d ?d_target)

      (not (same ?p_from ?p_to))

      (cur-stage ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      ;; move disk facts
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      ;; slot occupancy updated
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; top flags updated on source and destination
      (not (top ?s_from))
      (top ?s_below_src)

      (not (top ?s_target_top))
      (top ?s_to)

      ;; advance stage
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

  ;; Move top disk from a source peg whose top slot is also bottom (single-disk peg),
  ;; onto a non-empty destination peg.
  (:action move_from_bottom_to_nonempty
    :parameters (?d - disk
                 ?s_from - slot
                 ?p_from - peg
                 ?p_to - peg
                 ?s_target_top - slot
                 ?s_to - slot
                 ?d_target - disk
                 ?st - stage ?stnext - stage)
    :precondition (and
      (in ?d ?s_from)
      (top ?s_from)
      (bottom ?s_from ?p_from)
      (slot-of ?s_from ?p_from)

      (slot-of ?s_target_top ?p_to)
      (slot-of ?s_to ?p_to)
      (top ?s_target_top)
      (above ?s_to ?s_target_top)
      (not (occupied ?s_to))
      (in ?d_target ?s_target_top)
      (smaller ?d ?d_target)

      (not (same ?p_from ?p_to))

      (cur-stage ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      ;; move disk facts
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      ;; slot occupancy updated
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; top flags and peg-empty flags updated
      (not (top ?s_from))
      (peg-empty ?p_from)

      (not (top ?s_target_top))
      (top ?s_to)

      ;; advance stage
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )
)