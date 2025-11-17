(define (domain hanoi-2agents-20)
  (:requirements :typing :negative-preconditions)
  (:types agent support peg disk)
  (:predicates
    (can-move ?a - agent ?d - disk)
    (on ?d - disk ?s - support) ;; disk ?d is directly on support ?s (disk or peg)
    (clear ?d - disk)          ;; no disk on top of ?d
    (empty ?p - peg)           ;; peg has no disks
    (smaller ?d1 - disk ?d2 - disk) ;; ?d1 is strictly smaller than ?d2
  )

  ;; Move a top disk from a disk onto another disk
  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (can-move ?a ?d)
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
    )
  )

  ;; Move a top disk from a disk onto an empty peg
  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (empty ?to))
    )
  )

  ;; Move a top disk from a peg onto a disk
  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (empty ?from)
    )
  )

  ;; Move a top disk from a peg onto an empty peg
  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )
)