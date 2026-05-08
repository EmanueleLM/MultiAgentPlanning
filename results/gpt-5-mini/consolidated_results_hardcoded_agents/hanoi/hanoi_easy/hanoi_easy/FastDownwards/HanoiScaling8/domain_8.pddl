(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg time)

  (:predicates
    ;; A disk is directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; A disk is directly on another disk
    (on-disk ?d - disk ?u - disk)
    ;; The given disk has no disk on top of it (is topmost)
    (clear-disk ?d - disk)
    ;; The given peg has no disk on it (is empty)
    (clear-peg ?p - peg)
    ;; Size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)
    ;; Current time step marker
    (current ?t - time)
    ;; Successor relation over discrete time steps
    (succ ?t - time ?s - time)
  )

  ;; Move a disk that is directly on a peg to another empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - time ?s - time)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?s)
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes empty, destination peg becomes non-empty
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; moved disk remains topmost (it has no disk on top)
      (clear-disk ?d)

      ;; advance time by one step
      (not (current ?t))
      (current ?s)
    )
  )

  ;; Move a disk that is directly on a peg onto another topmost disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?t - time ?s - time)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?t)
      (succ ?t ?s)
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes empty
      (clear-peg ?from)

      ;; the disk we stacked on is no longer topmost; moved disk becomes topmost
      (not (clear-disk ?to))
      (clear-disk ?d)

      ;; advance time
      (not (current ?t))
      (current ?s)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - time ?s - time)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?s)
    )
    :effect (and
      ;; relocate disk
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the disk that was below ?d becomes topmost
      (clear-disk ?from)

      ;; destination peg becomes non-empty
      (not (clear-peg ?to))

      ;; moved disk is topmost
      (clear-disk ?d)

      ;; advance time
      (not (current ?t))
      (current ?s)
    )
  )

  ;; Move a disk that is directly on another disk onto another topmost disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?t - time ?s - time)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?t)
      (succ ?t ?s)
    )
    :effect (and
      ;; relocate disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the disk that was below ?d becomes topmost
      (clear-disk ?from)

      ;; target disk is no longer topmost; moved disk becomes topmost
      (not (clear-disk ?to))
      (clear-disk ?d)

      ;; advance time
      (not (current ?t))
      (current ?s)
    )
  )
)