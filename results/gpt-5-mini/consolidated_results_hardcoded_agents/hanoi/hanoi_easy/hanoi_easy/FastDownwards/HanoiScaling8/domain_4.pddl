(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg time)

  (:predicates
    ;; structural predicates
    (on-peg ?d - disk ?p - peg)    ;; disk ?d directly on peg ?p
    (on-disk ?d - disk ?u - disk)  ;; disk ?d directly on disk ?u
    (clear-disk ?d - disk)         ;; no disk on top of ?d (it is a top)
    (clear-peg ?p - peg)           ;; peg has no disks on it (empty)
    (smaller ?x - disk ?y - disk)  ;; x is smaller than y (static)
    (current ?t - time)            ;; global current stage/time pointer
    (succ ?t - time ?s - time)     ;; immediate successor relation between times
  )

  ;; Move a disk that is directly on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - time ?s - time)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?s)
      ;; ensure different places (optional but prevents no-op)
      (not (= ?from ?to))
    )
    :effect (and
      ;; update physical relations
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; after moving, target peg is no longer empty, source peg becomes empty
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; moved disk remains clear (it is top)
      (clear-disk ?d)

      ;; advance global time/stage
      (not (current ?t))
      (current ?s)
    )
  )

  ;; Move a disk that is directly on a peg onto a top disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?t - time ?s - time)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?t)
      (succ ?t ?s)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes empty
      (clear-peg ?from)

      ;; target disk is no longer clear (has ?d on top)
      (not (clear-disk ?to))

      ;; moved disk is top
      (clear-disk ?d)

      ;; advance time
      (not (current ?t))
      (current ?s)
    )
  )

  ;; Move a disk that is directly on another disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - time ?s - time)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?s)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; disk that was below becomes top
      (clear-disk ?from)

      ;; target peg no longer empty
      (not (clear-peg ?to))

      ;; moved disk is top
      (clear-disk ?d)

      ;; advance time
      (not (current ?t))
      (current ?s)
    )
  )

  ;; Move a disk that is directly on another disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?t - time ?s - time)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?t)
      (succ ?t ?s)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; disk that was below becomes top
      (clear-disk ?from)

      ;; target is no longer clear
      (not (clear-disk ?to))

      ;; moved disk is top
      (clear-disk ?d)

      ;; advance time
      (not (current ?t))
      (current ?s)
    )
  )
)