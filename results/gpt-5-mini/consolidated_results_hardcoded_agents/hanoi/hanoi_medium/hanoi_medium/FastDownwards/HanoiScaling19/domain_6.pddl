(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; direct support: disk ?d is directly on place ?p (place is either a peg or another disk)
    (on ?d - disk ?p - (either peg disk))

    ;; nothing is directly on place ?p (place is either a peg or a disk)
    (clear ?p - (either peg disk))

    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg.
  ;; Precondition:
  ;;  - ?d is directly on ?from
  ;;  - ?d has nothing on it (it is the top disk)
  ;;  - the target peg ?to has nothing on it (empty)
  ;; Effects:
  ;;  - remove the old support relation (on ?d ?from)
  ;;  - add the new support relation (on ?d ?to)
  ;;  - mark the target as not clear and the from-place as clear
  ;;  - ensure the moved disk is clear (nothing on it)
  (:action move-to-peg
    :parameters (?d - disk ?from - (either peg disk) ?to - peg)
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
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the target disk).
  ;; Same updates as move-to-peg, plus the size ordering precondition.
  (:action move-onto-disk
    :parameters (?d - disk ?from - (either peg disk) ?to - disk)
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
    )
  )
)