(define (domain hanoi)
  (:requirements :typing :negative-preconditions :strips)
  (:types disk peg)
  (:predicates
    ;; a disk is directly on a place (either a peg or another disk)
    (on ?d - disk ?p - object)
    ;; no disk is on top of this place (peg or disk)
    (clear ?o - object)
    ;; static relation: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg (or onto a peg whose top is not present).
  (:action move-to-peg
    :parameters (?disk - disk ?src - object ?dst - peg)
    :precondition (and
      (on ?disk ?src)        ; disk is directly on src
      (clear ?disk)          ; disk is the top disk at its source
      (clear ?dst)           ; destination peg is free at top (empty or larger disk required elsewhere)
      (not (on ?disk ?dst))  ; forbid no-op move to the same place
    )
    :effect (and
      (not (on ?disk ?src))
      (on ?disk ?dst)
      (clear ?src)           ; source becomes clear after removing the top disk
      (not (clear ?dst))     ; destination is no longer clear (has this disk on top)
    )
  )

  ;; Move a top disk onto another disk (must be smaller than destination disk)
  (:action move-to-disk
    :parameters (?disk - disk ?src - object ?dst - disk)
    :precondition (and
      (on ?disk ?src)        ; disk is directly on src
      (clear ?disk)          ; disk is the top disk at its source
      (clear ?dst)           ; destination disk must be clear (top of its stack)
      (smaller ?disk ?dst)   ; may only place smaller disk on larger disk
      (not (on ?disk ?dst))  ; forbid no-op move to the same place
    )
    :effect (and
      (not (on ?disk ?src))
      (on ?disk ?dst)
      (clear ?src)           ; source becomes clear after removing the top disk
      (not (clear ?dst))     ; the destination disk is no longer clear (now has a disk on it)
    )
  )
)