(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  ;; Predicates
  (:predicates
    (on ?d - disk ?under - disk)        ; immediate support: ?d is directly on disk ?under
    (on-peg ?d - disk ?p - peg)         ; transitive membership: ?d is somewhere on peg ?p
    (clear ?d - disk)                   ; no disk on top of ?d (movable)
    (peg-empty ?p - peg)                ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)     ; static size ordering: d1 is smaller than d2
  )

  ;; Move a disk that is directly supported by a disk onto an empty peg.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and
      (clear ?d)
      (on ?d ?under)
      (on-peg ?under ?from)
      (on-peg ?d ?from)
      (peg-empty ?to)
    )
    :effect (and
      (not (on ?d ?under))
      (on-peg ?d ?to)
      (not (on-peg ?d ?from))
      (not (peg-empty ?to))
      (clear ?under)
    )
  )

  ;; Move a disk that is directly supported by a disk onto another disk (target top disk must be larger).
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (clear ?d)
      (on ?d ?under)
      (on-peg ?under ?from)
      (on-peg ?d ?from)
      (on-peg ?top ?to)
      (clear ?top)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?top)
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear ?top))
      (clear ?under)
    )
  )

  ;; Move a disk that is directly on a peg onto another disk (target top disk must be larger).
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (clear ?d)
      (on-peg ?d ?from)
      (on-peg ?top ?to)
      (clear ?top)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on ?d ?top)
      (on-peg ?d ?to)
      (not (clear ?top))
      (peg-empty ?from)
    )
  )

  ;; Move a disk that is directly on a peg onto an empty peg.
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (clear ?d)
      (on-peg ?d ?from)
      (peg-empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (peg-empty ?to))
      (peg-empty ?from)
    )
  )
)