(define (domain hanoi-single-move)
  (:requirements :strips :typing)
  (:types
    support
    peg disk - support
  )
  (:predicates
    ; membership of a disk on a peg
    (on ?d - disk ?p - peg)

    ; direct support relation: a disk sits directly on a support (either a disk or a peg)
    (above ?d - disk ?s - support)

    ; a support (disk or peg) is free (no disk currently on it)
    (free ?s - support)

    ; bookkeeping predicates requested in the specification (not needed in preconditions/effects)
    (clear ?d - disk)
    (clear-peg ?p - peg)
    (top ?d - disk)

    ; static size-order relation
    (smaller ?d1 - disk ?d2 - disk)

    ; the peg associated with a support (for pegs it is itself; for disks it is the peg the disk belongs to)
    (at-peg ?s - support ?p - peg)

    ; statically allowed destinations: true if destination support is a peg, or a disk larger than the moving disk
    (okdest ?d - disk ?s - support)
  )

  (:action move
    :parameters (?d - disk ?from - support ?to - support ?pf - peg ?pt - peg)
    :precondition (and
      ; disk is currently the top disk on some support
      (free ?d)
      (above ?d ?from)
      ; source peg consistency
      (at-peg ?from ?pf)
      (on ?d ?pf)
      ; destination is free and acceptable
      (free ?to)
      (at-peg ?to ?pt)
      (okdest ?d ?to)
    )
    :effect (and
      ; lift from source support
      (not (above ?d ?from))
      (free ?from)
      ; place on destination support
      (above ?d ?to)
      (not (free ?to))
      ; update peg membership of the moved disk (and its support-level alias)
      (not (on ?d ?pf))
      (on ?d ?pt)
      (not (at-peg ?d ?pf))
      (at-peg ?d ?pt)
    )
  )
)