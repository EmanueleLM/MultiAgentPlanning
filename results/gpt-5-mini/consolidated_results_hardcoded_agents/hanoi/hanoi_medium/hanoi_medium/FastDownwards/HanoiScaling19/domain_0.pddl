(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types loc disk peg)

  (:predicates
    ;; Relations
    (on ?d - disk ?x - loc)        ;; disk ?d is immediately on loc ?x (which may be a disk or a peg)
    (clear ?x - loc)              ;; no disk is immediately on ?x
    (empty ?p - peg)              ;; peg has no disks (no disk is immediately on the peg)
    ;; Static size ordering
    (smaller ?d1 - disk ?d2 - disk)
    ;; Optional static typing facts (kept as initial-state facts for clarity)
    (disk ?d - disk)
    (peg ?p - peg)
  )

  ;; Move a top disk that is immediately on a peg to an empty destination peg.
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (on ?d ?src)
      (clear ?d)            ;; d must be top (no disk on it)
      (empty ?dst)          ;; destination peg empty
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?src))
      (on ?d ?dst)

      ;; source becomes clear and (since it was a peg and its top disk moved) becomes empty
      (clear ?src)
      (empty ?src)

      ;; destination is no longer clear / empty (it now has d directly on it)
      (not (clear ?dst))
      (not (empty ?dst))

      ;; moved disk remains clear (topmost)
      (clear ?d)
    )
  )

  ;; Move a top disk that is immediately on a disk to an empty destination peg.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?src - disk ?dst - peg)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (empty ?dst)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)

      ;; the disk that was supporting ?d now becomes clear
      (clear ?src)

      ;; destination is no longer clear/empty
      (not (clear ?dst))
      (not (empty ?dst))

      ;; moved disk remains clear
      (clear ?d)
    )
  )

  ;; Move a top disk that is immediately on a peg onto the top disk of a destination peg.
  (:action move-from-peg-onto
    :parameters (?d - disk ?src - peg ?dst - peg ?top - disk)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (on ?top ?dst)         ;; ?top is the disk directly on destination peg
      (clear ?top)           ;; ?top is topmost on destination peg
      (smaller ?d ?top)      ;; size constraint: cannot place larger on smaller
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?top)

      ;; source peg becomes clear/empty after removal of its top disk
      (clear ?src)
      (empty ?src)

      ;; the disk that was top on destination is no longer clear (has ?d on it)
      (not (clear ?top))

      ;; destination peg remains non-empty (it already had a disk)
      (not (empty ?dst))

      ;; moved disk remains clear
      (clear ?d)
    )
  )

  ;; Move a top disk that is immediately on a disk onto the top disk of a destination peg.
  (:action move-from-disk-onto
    :parameters (?d - disk ?src - disk ?dst - peg ?top - disk)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (on ?top ?dst)
      (clear ?top)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?top)

      ;; the disk that supported ?d becomes clear
      (clear ?src)

      ;; the destination top disk gains ?d on it and is no longer clear
      (not (clear ?top))

      ;; moved disk remains clear (it is now top)
      (clear ?d)

      ;; destination peg remains non-empty
      (not (empty ?dst))
    )
  )
)