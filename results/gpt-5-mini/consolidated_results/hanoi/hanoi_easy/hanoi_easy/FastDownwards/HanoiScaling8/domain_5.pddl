(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg time)

  (:predicates
    ; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ; disk directly on another disk
    (on-disk ?d - disk ?u - disk)
    ; no disk on top of this disk (it is the topmost disk of its stack)
    (clear-disk ?d - disk)
    ; the peg has no disks on it (empty)
    (clear-peg ?p - peg)
    ; static size relation: smaller ?x ?y means x is smaller than y
    (smaller ?x - disk ?y - disk)
    ; current global time/stage pointer (exactly one holds)
    (current ?t - time)
    ; immediate successor relation between times
    (succ ?t - time ?s - time)
  )

  ; Move a disk that is directly on a peg to an empty peg (advance one stage).
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
      ; disk no longer directly on source peg, now directly on target peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ; target peg is no longer empty, source peg becomes empty
      (not (clear-peg ?to))
      (clear-peg ?from)

      ; moved disk is top
      (clear-disk ?d)

      ; advance global time/stage pointer
      (not (current ?t))
      (current ?s)
    )
  )

  ; Move a disk that is directly on a peg onto a top disk (advance one stage).
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
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ; source peg becomes empty (disk was directly on peg)
      (clear-peg ?from)

      ; target disk is no longer clear (has ?d on top)
      (not (clear-disk ?to))

      ; moved disk is top
      (clear-disk ?d)

      ; advance global time/stage pointer
      (not (current ?t))
      (current ?s)
    )
  )

  ; Move a disk that is directly on another disk onto an empty peg (advance one stage).
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
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ; disk that was below becomes topmost of its stack
      (clear-disk ?from)

      ; target peg is no longer empty
      (not (clear-peg ?to))

      ; moved disk is top
      (clear-disk ?d)

      ; advance global time/stage pointer
      (not (current ?t))
      (current ?s)
    )
  )

  ; Move a disk that is directly on another disk onto another top disk (advance one stage).
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
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ; disk that was below becomes topmost of its stack
      (clear-disk ?from)

      ; target is no longer clear (has ?d on top)
      (not (clear-disk ?to))

      ; moved disk is top
      (clear-disk ?d)

      ; advance global time/stage pointer
      (not (current ?t))
      (current ?s)
    )
  )
)