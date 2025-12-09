(define (domain hanoi-integrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk directly on a support (support may be a disk or a peg)
    (on ?d - disk ?s - object)
    ;; a support (disk or peg) has nothing directly on top of it
    (clear ?x - object)
    ;; static size ordering: smaller ?d1 ?d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; observer records: a concrete observed move of one disk from one support to another
    (observed-move ?d - disk ?from - object ?to - object)
    ;; auditor records that an observed move has been independently audited/verified
    (audited-move ?d - disk ?from - object ?to - object)
  )

  ;; Move a single clear disk from any support to an empty peg.
  ;; Preconditions enforce:
  ;;  - the disk is currently directly on the source support,
  ;;  - the disk has no disk on top of it (top-of-stack),
  ;;  - the destination peg is clear (empty).
  ;; Effects:
  ;;  - disk is no longer on the source support and is now directly on the destination peg,
  ;;  - the destination peg ceases to be clear,
  ;;  - the former source support becomes clear (nothing directly on it),
  ;;  - the move is recorded by the observer.
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (observed-move ?d ?from ?to)
    )
  )

  ;; Move a single clear disk from any support to a clear disk support.
  ;; Additional precondition enforces disk-size ordering: only smaller on larger allowed.
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (observed-move ?d ?from ?to)
    )
  )

  ;; Auditor action: produces an independent audit record for an observed move.
  ;; Requires the observer record and deterministically produces the audited record.
  ;; This separates mover/observer reporting from auditor verification explicitly.
  (:action audit-observed-move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (observed-move ?d ?from ?to)
    :effect (and
      (audited-move ?d ?from ?to)
    )
  )
)