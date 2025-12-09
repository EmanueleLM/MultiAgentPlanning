(define (domain tower-of-hanoi-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg slot stage)

  (:predicates
    (disk ?d - disk)
    (peg ?p - peg)
    (slot ?s - slot)
    (stage ?t - stage)

    (slot-of ?s - slot ?p - peg)
    (above ?s_above - slot ?s_below - slot)
    (bottom ?s - slot ?p - peg)

    (in ?d - disk ?s - slot)
    (occupied ?s - slot)
    (top ?s - slot)
    (peg-empty ?p - peg)

    (smaller ?small - disk ?large - disk)

    (same ?p1 - peg ?p2 - peg)

    (cur-stage ?t - stage)
    (succ ?t1 - stage ?t2 - stage)
  )

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
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      (not (occupied ?s_from))
      (occupied ?s_to)

      (not (top ?s_from))
      (top ?s_below)

      (not (peg-empty ?p_to))
      (top ?s_to)

      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

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
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      (not (occupied ?s_from))
      (occupied ?s_to)

      (not (top ?s_from))
      (peg-empty ?p_from)

      (not (peg-empty ?p_to))
      (top ?s_to)

      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

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
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      (not (occupied ?s_from))
      (occupied ?s_to)

      (not (top ?s_from))
      (top ?s_below_src)

      (not (top ?s_target_top))
      (top ?s_to)

      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )

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
      (not (in ?d ?s_from))
      (in ?d ?s_to)

      (not (occupied ?s_from))
      (occupied ?s_to)

      (not (top ?s_from))
      (peg-empty ?p_from)

      (not (top ?s_target_top))
      (top ?s_to)

      (not (cur-stage ?st))
      (cur-stage ?stnext)
    )
  )
)