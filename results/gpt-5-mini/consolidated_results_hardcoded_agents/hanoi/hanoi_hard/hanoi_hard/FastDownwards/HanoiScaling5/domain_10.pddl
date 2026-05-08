(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk ?d directly on peg ?p (bottom of a stack)
    (on-disk ?d - disk ?under - disk) ; disk ?d directly on top of disk ?under
    (clear-disk ?d - disk)            ; no disk on top of ?d
    (clear-peg ?p - peg)              ; peg ?p has no disks (top is empty)
    (larger ?big - disk ?small - disk); size ordering: ?big is larger than ?small
    (cur-step ?s - step)              ; current discrete stage
    (succ ?s1 - step ?s2 - step)      ; successor relation between stages
  )

  ;; Move a top disk that is sitting directly on a peg onto an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (cur-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      ;; moved disk remains clear (no disk on top)
      (clear-disk ?d)
      (not (cur-step ?s))
      (cur-step ?s2)
    )
  )

  ;; Move a top disk that is on top of another disk onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (cur-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      ;; disk below becomes clear (no disk on top) after removal
      (clear-disk ?from)
      ;; moved disk is on top, so it has no disk on top
      (clear-disk ?d)
      (not (cur-step ?s))
      (cur-step ?s2)
    )
  )

  ;; Move a top disk that is sitting directly on a peg onto another disk (which must be larger)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (larger ?to ?d)
      (cur-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
      ;; moved disk remains clear (no disk on top)
      (clear-disk ?d)
      (not (cur-step ?s))
      (cur-step ?s2)
    )
  )

  ;; Move a top disk that is on top of one disk onto another disk (which must be larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (larger ?to ?d)
      (cur-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      ;; disk below becomes clear after removal
      (clear-disk ?from)
      ;; moved disk remains clear
      (clear-disk ?d)
      (not (cur-step ?s))
      (cur-step ?s2)
    )
  )
)