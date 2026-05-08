(define (domain tower-of-hanoi-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg slot stage)

  (:predicates
    ; types (redundant typing predicates, kept explicit)
    (disk ?d - disk)
    (peg ?p - peg)
    (slot ?s - slot)
    (stage ?t - stage)

    ; layout relations
    (slot-of ?s - slot ?p - peg)        ; slot belongs to peg
    (above ?s_above - slot ?s_below - slot) ; immediate above relation: s_above is directly above s_below
    (bottom ?s - slot ?p - peg)         ; s is bottom slot of peg

    ; occupancy and ordering
    (in ?d - disk ?s - slot)            ; disk occupies slot
    (occupied ?s - slot)                ; slot currently occupied
    (top ?s - slot)                     ; slot is the topmost occupied slot on its peg
    (peg-empty ?p - peg)                ; peg currently empty

    ; disk size ordering (static)
    (smaller ?small - disk ?large - disk)

    ; peg identity predicate to avoid using equality
    (same ?p1 - peg ?p2 - peg)

    ; discrete stage progression
    (cur-stage ?t - stage)
    (succ ?t1 - stage ?t2 - stage)
  )

  ; Move a top disk that has an occupied slot below it to an empty peg (disk goes to that peg's bottom slot).
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

      (not (same ?p_from ?p_to))

      (cur-stage ?st)
      (succ ?st ?stnext)
    )
    :effect (and
      ; move disk from source slot to target bottom slot
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      (not (occupied ?s_from))
      (occupied ?s_to)

      ; update tops on source peg
      (not (top ?s_from))
      (top ?s_below)

      ; update peg-empty and top on target peg
      (not (peg-empty ?p_to))
      (top ?s_to)

      ; stage progression
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

  ; Move a top disk that is the bottom slot of its peg to an empty peg (source peg becomes empty).
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
      ; occupancy changes
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      (not (occupied ?s_from))
      (occupied ?s_to)

      ; source peg becomes empty (no top)
      (not (top ?s_from))
      (peg-empty ?p_from)

      ; target peg non-empty and top updated
      (not (peg-empty ?p_to))
      (top ?s_to)

      ; stage progression
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

  ; Move a top disk that has an occupied slot below it to a non-empty peg,
  ; placing it into the slot immediately above the current target top (which must be unoccupied).
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
      ; move occupancy
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      (not (occupied ?s_from))
      (occupied ?s_to)

      ; update source top
      (not (top ?s_from))
      (top ?s_below_src)

      ; update target top
      (not (top ?s_target_top))
      (top ?s_to)

      ; stage progression
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

  ; Move a top disk that is at the bottom of its peg to a non-empty peg,
  ; placing it into the slot immediately above the current target top.
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
      ; occupancy changes
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      (not (occupied ?s_from))
      (occupied ?s_to)

      ; source peg becomes empty
      (not (top ?s_from))
      (peg-empty ?p_from)

      ; target top update
      (not (top ?s_target_top))
      (top ?s_to)

      ; stage progression
      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )
)