(define (domain tower-of-hanoi)
  (:requirements :strips :typing :action-costs)
  (:types
    disk peg - object
  )
  (:predicates
    (on ?d - disk ?l - (either disk peg))
    (clear ?l - (either disk peg))
    (smaller ?d1 - disk ?d2 - disk)
  )
  (:functions
    (total-cost) - number
  )

  ; Action 1: Move a disk D from L_FROM (disk or peg) onto an empty destination PEG P_TO
  (:action move-to-peg
    :parameters (?d - disk ?l_from - (either disk peg) ?p_to - peg)
    :precondition (and
      (on ?d ?l_from)
      (clear ?d)
      (clear ?p_to)
    )
    :effect (and
      (not (on ?d ?l_from))
      (on ?d ?p_to)
      (not (clear ?p_to))
      (clear ?l_from)
      (increase (total-cost) 1)
    )
  )

  ; Action 2: Move a disk D from L_FROM (disk or peg) onto a destination DISK D_TO (clear, larger)
  (:action move-to-disk
    :parameters (?d - disk ?l_from - (either disk peg) ?d_to - disk)
    :precondition (and
      (on ?d ?l_from)
      (clear ?d)
      (clear ?d_to)
      (smaller ?d ?d_to)
    )
    :effect (and
      (not (on ?d ?l_from))
      (on ?d ?d_to)
      (not (clear ?d_to))
      (clear ?l_from)
      (increase (total-cost) 1)
    )
  )
)