(define (domain tower-of-hanoi-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg slot stage)

  (:predicates
    ;; object typing (explicit)
    (disk ?d - disk)
    (peg ?p - peg)
    (slot ?s - slot)
    (stage ?t - stage)

    ;; slot layout
    (slot-of ?s - slot ?p - peg)
    (above ?s_above - slot ?s_below - slot) ;; immediate above relation
    (bottom ?s - slot ?p - peg)             ;; s is the bottom slot of peg p

    ;; occupancy and stack control
    (in ?d - disk ?s - slot)                ;; disk occupies slot
    (occupied ?s - slot)                    ;; slot occupied
    (top ?s - slot)                         ;; slot is topmost occupied on its peg
    (peg-empty ?p - peg)                    ;; peg has no disks

    ;; disk size ordering
    (smaller ?small - disk ?large - disk)

    ;; discrete stage progression
    (cur-stage ?t - stage)
    (succ ?t1 - stage ?t2 - stage)
  )

  ;; Move a top disk from a source slot that has an occupied slot immediately below it,
  ;; to a target peg that is currently empty (disk goes to that peg's bottom slot).
  (:action move_from_with_below_to_empty
    :parameters (?d - disk
                 ?s_from - slot ?s_below - slot
                 ?p_from - peg ?p_to - peg
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

      (cur-stage ?st)
      (succ ?st ?stnext)
      (not (= ?p_from ?p_to))
    )
    :effect (and
      ;; move occupancy
      (not (in ?d ?s_from))
      (in ?d ?s_to)
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; update tops
      (not (top ?s_from))
      (top ?s_below)

      ;; target peg now non-empty and new top
      (not (peg-empty ?p_to))
      (top ?s_to)

      ;; stage progression (single-threaded discrete time)
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

  ;; Move a top disk from a source slot that is the bottom slot of its peg,
  ;; to a target peg that is empty (disk becomes target bottom; source peg becomes empty).
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

      (cur-stage ?st)
      (succ ?st ?stnext)
      (not (= ?p_from ?p_to))
    )
    :effect (and
      ;; move occupancy
      (not (in ?d ?s_from))
      (in ?d ?s_to)
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; source peg now empty
      (not (top ?s_from))
      (peg-empty ?p_from)

      ;; target peg non-empty and new top
      (not (peg-empty ?p_to))
      (top ?s_to)

      ;; stage progression
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

  ;; Move a top disk from a source slot that has an occupied slot below it,
  ;; to a target peg that is non-empty (place onto the slot immediately above target top).
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

      (cur-stage ?st)
      (succ ?st ?stnext)
      (not (= ?p_from ?p_to))
    )
    :effect (and
      ;; move occupancy
      (not (in ?d ?s_from))
      (in ?d ?s_to)
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; source top update
      (not (top ?s_from))
      (top ?s_below_src)

      ;; target top update
      (not (top ?s_target_top))
      (top ?s_to)

      ;; stage progression
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

  ;; Move a top disk from a source slot that is bottom (no below),
  ;; to a target peg that is non-empty (place onto the slot immediately above target top).
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

      (cur-stage ?st)
      (succ ?st ?stnext)
      (not (= ?p_from ?p_to))
    )
    :effect (and
      ;; move occupancy
      (not (in ?d ?s_from))
      (in ?d ?s_to)
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; source peg becomes empty
      (not (top ?s_from))
      (peg-empty ?p_from)

      ;; target top update
      (not (top ?s_target_top))
      (top ?s_to)

      ;; stage progression
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )
)