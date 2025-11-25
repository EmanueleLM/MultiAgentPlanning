(define (domain towers-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    ; type membership predicate for the agent (keeps agent actions explicit)
    (agent ?a - agent)

    ; immediate support relation: disk is directly on either a disk or a peg
    (on ?d - disk ?s - (either disk peg))

    ; support is clear (no disk on it). Applies to disks and pegs.
    (clear ?x - (either disk peg))

    ; top-of-peg relation: which disk is directly on a peg (if any)
    (peg-top ?d - disk ?p - peg)

    ; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; Move a top disk from one peg to another empty peg
  (:action move-peg-to-peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (agent ?a)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ; destination peg is no longer clear; source peg becomes clear
      (not (clear ?to))
      (clear ?from)

      ; update peg-top: remove previous peg-top and set new peg-top for destination
      (not (peg-top ?d ?from))
      (peg-top ?d ?to)
    )
  )

  ; Move a top disk from a peg to a top disk (on some peg or disk), obeying size constraint
  (:action move-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (agent ?a)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ; source peg becomes clear (destination disk no longer clear)
      (clear ?from)
      (not (clear ?to))

      ; remove peg-top association for the disk that was on the peg
      (not (peg-top ?d ?from))
    )
  )

  ; Move a top disk from a disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (agent ?a)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ; destination peg not clear; source disk becomes clear
      (not (clear ?to))
      (clear ?from)

      ; new peg-top for destination peg
      (peg-top ?d ?to)
    )
  )

  ; Move a top disk from a disk to another top disk, obeying size constraint
  (:action move-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (agent ?a)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ; source disk becomes clear, destination disk is no longer clear
      (clear ?from)
      (not (clear ?to))
    )
  )
)