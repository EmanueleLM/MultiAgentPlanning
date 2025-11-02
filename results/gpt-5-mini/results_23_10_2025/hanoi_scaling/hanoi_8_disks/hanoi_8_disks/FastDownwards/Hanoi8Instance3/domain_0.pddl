(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk peg)

  (:predicates
    ;; Disk placement predicates:
    ;; on-disk ?d ?below means disk ?d is directly on top of disk ?below
    (on-disk ?d - disk ?below - disk)
    ;; on-peg ?d ?p means disk ?d is directly on peg ?p
    (on-peg ?d - disk ?p - peg)

    ;; Clearness for supports:
    (clear-disk ?d - disk)  ;; true if no disk is directly on top of this disk
    (clear-peg ?p - peg)    ;; true if no disk is directly on this peg

    ;; Size relation: smaller ?x ?y means disk ?x is strictly smaller than disk ?y
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a top disk from one disk to another disk (destination disk must be larger)
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
      (clear-disk ?from)    ;; the disk below becomes top (clear)
      (not (clear-disk ?to));; the destination disk now has ?d on top
    )
  )

  ;; Move a top disk from a disk onto a peg
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?p - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?p)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?p)
      (clear-disk ?from)    ;; the disk below becomes top (clear)
      (not (clear-peg ?p))  ;; peg now has a disk on it
    )
  )

  ;; Move a top disk from a peg onto a disk (destination disk must be larger)
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
      (clear-peg ?from)     ;; peg becomes empty (top removed)
      (not (clear-disk ?to));; destination disk now has ?d on top
    )
  )

  ;; Move a top disk from one peg to another peg
  (:action move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )
)