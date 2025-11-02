(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk-on-disk and disk-on-peg model "on" relationships
    (on-disk ?d - disk ?under - disk)
    (on-peg  ?d - disk ?p - peg)

    ;; clear predicates for disks and pegs (top-of-stack / peg empty)
    (clear-disk ?d - disk)
    (clear-peg  ?p - peg)

    ;; size ordering: smaller X Y means X is smaller than Y (strict)
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a disk that is on a disk to an empty peg
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg  ?d ?to)

      ;; the disk that was under ?d becomes clear (since ?d removed)
      (clear-disk ?from)

      ;; target peg is no longer empty
      (not (clear-peg ?to))

      ;; moved disk is top -> remains clear
      (clear-disk ?d)
    )
  )

  ;; Move a disk that is on a peg to another empty peg
  (:action move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg  ?d ?to)

      ;; source peg may become empty
      (clear-peg ?from)

      ;; target peg is no longer empty
      (not (clear-peg ?to))

      ;; moved disk is top -> remains clear
      (clear-disk ?d)
    )
  )

  ;; Move a disk that is on a disk to another disk (respecting size)
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the disk that was under ?d becomes clear
      (clear-disk ?from)

      ;; the disk ?to is no longer clear (it now has ?d on top)
      (not (clear-disk ?to))

      ;; moved disk is top -> remains clear
      (clear-disk ?d)
    )
  )

  ;; Move a disk that is on a peg to another disk (respecting size)
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg may become empty
      (clear-peg ?from)

      ;; the disk ?to is no longer clear
      (not (clear-disk ?to))

      ;; moved disk is top -> remains clear
      (clear-disk ?d)
    )
  )
)