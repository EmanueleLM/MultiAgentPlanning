(define (domain tower-of-hanoi-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg slot stage)

  (:predicates
    (in ?d - disk ?s - slot)
    (occupied ?s - slot)
    (top ?s - slot)
    (slot-of ?s - slot ?p - peg)
    (above ?s_above - slot ?s_below - slot)
    (bottom ?s - slot ?p - peg)
    (peg-empty ?p - peg)

    (smaller ?small - disk ?large - disk)

    (same ?p1 - peg ?p2 - peg)

    (cur-stage ?t - stage)
    (succ ?t1 - stage ?t2 - stage)
  )

  ;; Move a top disk from a non-bottom slot (there is an occupied slot directly below)
  ;; to an empty peg (placing on its bottom slot).
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
      ;; move disk
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      ;; occupancy updates
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; top updates on source peg
      (not (top ?s_from))
      (top ?s_below)

      ;; target peg was empty, now not empty
      (not (peg-empty ?p_to))
      (top ?s_to)

      ;; advance stage
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

  ;; Move a top disk from a bottom slot (after move the peg becomes empty)
  ;; to an empty peg (placing on its bottom slot).
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
      ;; move disk
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      ;; occupancy updates
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; source peg becomes empty
      (not (top ?s_from))
      (peg-empty ?p_from)

      ;; target peg was empty, now not empty
      (not (peg-empty ?p_to))
      (top ?s_to)

      ;; advance stage
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

  ;; Move a top disk from a non-bottom slot to a non-empty target peg (placing above its current top)
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
      (above ?s_to ?s_target_top)            ; s_to is directly above the current top
      (not (occupied ?s_to))
      (in ?d_target ?s_target_top)
      (smaller ?d ?d_target)                 ; moved disk must be smaller than target top

      (not (same ?p_from ?p_to))

      (cur-stage ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      ;; move disk
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      ;; occupancy updates
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; source top and new source top
      (not (top ?s_from))
      (top ?s_below_src)

      ;; target top changes
      (not (top ?s_target_top))
      (top ?s_to)

      ;; advance stage
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

  ;; Move a top disk from a bottom slot to a non-empty target peg (placing above its current top)
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
      ;; move disk
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      ;; occupancy updates
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; source peg becomes empty
      (not (top ?s_from))
      (peg-empty ?p_from)

      ;; target top changes
      (not (top ?s_target_top))
      (top ?s_to)

      ;; advance stage
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )
)