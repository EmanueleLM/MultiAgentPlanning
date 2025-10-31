(define (domain hanoi-7-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk/peg locations:
    (on-peg ?d - disk ?p - peg)     ; disk ?d is directly on peg ?p (top-most on that peg)
    (on-disk ?d - disk ?d2 - disk) ; disk ?d is directly on top of disk ?d2

    ;; clear predicates:
    (clear-disk ?d - disk)         ; nothing is on disk ?d
    (clear-peg ?p - peg)           ; peg ?p has no disk on top

    ;; size:
    (larger ?d1 - disk ?d2 - disk) ; ?d1 is strictly larger than ?d2
  )

  ;; Move a top disk from a peg onto an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; after placing disk on target peg, target peg is not clear, source peg becomes clear
      (not (clear-peg ?to))
      (clear-peg ?from)
    )
  )

  ;; Move a top disk from a peg onto a larger disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?below - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?below)
      (larger ?below ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?below)

      ;; below disk no longer clear; source peg becomes clear
      (not (clear-disk ?below))
      (clear-peg ?from)
    )
  )

  ;; Move a top disk from on top of a disk onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?under - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?to)

      ;; formerly-under disk becomes clear; target peg no longer clear
      (clear-disk ?under)
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk from on top of a disk onto a larger disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?below - disk)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-disk ?below)
      (larger ?below ?d)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-disk ?d ?below)

      ;; formerly-under disk becomes clear; below disk no longer clear
      (clear-disk ?under)
      (not (clear-disk ?below))
    )
  )
)