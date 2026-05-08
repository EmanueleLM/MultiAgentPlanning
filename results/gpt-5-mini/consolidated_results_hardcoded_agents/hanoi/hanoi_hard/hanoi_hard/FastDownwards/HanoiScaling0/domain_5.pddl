(define (domain hanoi6)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk location and support
    (at ?d - disk ?p - peg)          ; disk is on peg ?p (peg-level membership)
    (on-disk ?d - disk ?under - disk) ; disk directly on top of another disk
    (on-base ?d - disk ?p - peg)    ; disk directly on the peg base (no disk under it)

    ;; top/empty markers
    (clear ?d - disk)               ; disk is top on its peg
    (empty ?p - peg)                ; peg has no disks (empty)

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; step control for strict sequential progression
    (current ?s - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move a top disk that is on another disk onto another disk (possibly on different peg).
  (:action move-disk-from-disk-to-disk
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?under - disk ?destTop - disk)
    :precondition (and
      (current ?s) (succ ?s ?s2)

      ;; disk is on source peg and top
      (at ?d ?from)
      (clear ?d)

      ;; disk supported by another disk on same source peg
      (on-disk ?d ?under)
      (at ?under ?from)

      ;; destination top disk exists and is top on destination peg
      (at ?destTop ?to)
      (clear ?destTop)

      ;; size constraint
      (smaller ?d ?destTop)
    )
    :effect (and
      ;; advance step
      (not (current ?s)) (current ?s2)

      ;; move disk membership
      (not (at ?d ?from)) (at ?d ?to)

      ;; update support relations
      (not (on-disk ?d ?under)) (on-disk ?d ?destTop)

      ;; destination top no longer clear; moved disk becomes clear
      (not (clear ?destTop))
      (clear ?d)

      ;; the disk that lost its top becomes clear
      (clear ?under)
    )
  )

  ;; Move a top disk that is on another disk onto an empty peg base.
  (:action move-disk-from-disk-to-base
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?under - disk)
    :precondition (and
      (current ?s) (succ ?s ?s2)

      (at ?d ?from)
      (clear ?d)

      (on-disk ?d ?under)
      (at ?under ?from)

      (empty ?to)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      (not (at ?d ?from)) (at ?d ?to)

      (not (on-disk ?d ?under)) (on-base ?d ?to)

      ;; destination ceases to be empty
      (not (empty ?to))

      ;; moved disk is top at destination
      (clear ?d)

      ;; the disk that lost its top becomes clear
      (clear ?under)
    )
  )

  ;; Move a top disk that is on the peg base onto another disk.
  (:action move-disk-from-base-to-disk
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?destTop - disk)
    :precondition (and
      (current ?s) (succ ?s ?s2)

      (at ?d ?from)
      (clear ?d)

      (on-base ?d ?from)

      (at ?destTop ?to)
      (clear ?destTop)

      (smaller ?d ?destTop)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      (not (at ?d ?from)) (at ?d ?to)

      (not (on-base ?d ?from)) (on-disk ?d ?destTop)

      ;; destination top no longer clear; moved disk becomes clear
      (not (clear ?destTop))
      (clear ?d)

      ;; source peg becomes empty (disk was on base)
      (empty ?from)
    )
  )

  ;; Move a top disk that is on the peg base onto an empty peg base.
  (:action move-disk-from-base-to-base
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (current ?s) (succ ?s ?s2)

      (at ?d ?from)
      (clear ?d)

      (on-base ?d ?from)

      (empty ?to)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      (not (at ?d ?from)) (at ?d ?to)

      (not (on-base ?d ?from)) (on-base ?d ?to)

      ;; destination ceases to be empty; source becomes empty
      (not (empty ?to))
      (empty ?from)

      ;; moved disk is top at destination
      (clear ?d)
    )
  )
)