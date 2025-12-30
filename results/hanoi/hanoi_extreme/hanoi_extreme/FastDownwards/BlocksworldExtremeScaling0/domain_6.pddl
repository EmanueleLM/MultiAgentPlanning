(define (domain hanoi-7disk)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    disk peg
  )
  (:predicates
    ; State representation
    (on ?d1 - disk ?d2 - disk)   ; d1 is immediately on d2
    (bottom ?d - disk ?p - peg)  ; d is the bottom disk on p
    (clear-disk ?d - disk)       ; d is the top disk (nothing on it)
    (clear-peg ?p - peg)         ; p is empty

    ; Static size relations (d1 is smaller than d2)
    (smaller ?d1 - disk ?d2 - disk)
  )
  (:functions
    (total-cost)
  )

  ; 1. Move disk D from D_BELOW onto D_ABOVE (Disk to Disk)
  (:action MOVE_D_D
    :parameters (?d - disk ?d_below - disk ?d_above - disk)
    :precondition (and
      (clear-disk ?d)
      (on ?d ?d_below)
      (clear-disk ?d_above)
      (smaller ?d ?d_above) ; D must be smaller than the disk it is placed on
    )
    :effect (and
      (not (on ?d ?d_below))
      (on ?d ?d_above)
      (clear-disk ?d_below)
      (not (clear-disk ?d_above))
      (increase (total-cost) 1)
    )
  )

  ; 2. Move disk D from D_BELOW onto P_TO (empty peg) (Disk to Peg, from Disk)
  (:action MOVE_D_P_FROM_D
    :parameters (?d - disk ?d_below - disk ?p_to - peg)
    :precondition (and
      (clear-disk ?d)
      (on ?d ?d_below)
      (clear-peg ?p_to)
    )
    :effect (and
      (not (on ?d ?d_below))
      (bottom ?d ?p_to)
      (clear-disk ?d_below)
      (not (clear-peg ?p_to))
      (increase (total-cost) 1)
    )
  )

  ; 3. Move D from P_FROM (D is bottom disk) onto D_ABOVE (Disk to Disk, from Peg)
  (:action MOVE_D_D_FROM_P
    :parameters (?d - disk ?p_from - peg ?d_above - disk)
    :precondition (and
      (clear-disk ?d)
      (bottom ?d ?p_from)
      (clear-disk ?d_above)
      (smaller ?d ?d_above) ; D must be smaller than the disk it is placed on
    )
    :effect (and
      (not (bottom ?d ?p_from))
      (on ?d ?d_above)
      (clear-peg ?p_from)
      (not (clear-disk ?d_above))
      (increase (total-cost) 1)
    )
  )

  ; 4. Move D from P_FROM (D is bottom disk) onto P_TO (empty peg) (Disk to Peg, from Peg)
  (:action MOVE_D_P_FROM_P
    :parameters (?d - disk ?p_from - peg ?p_to - peg)
    :precondition (and
      (clear-disk ?d)
      (bottom ?d ?p_from)
      (clear-peg ?p_to)
      (not (= ?p_from ?p_to))
    )
    :effect (and
      (not (bottom ?d ?p_from))
      (bottom ?d ?p_to)
      (clear-peg ?p_from)
      (not (clear-peg ?p_to))
      (increase (total-cost) 1)
    )
  )
)