(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly on another disk
    (on-disk ?d - disk ?u - disk)
    ;; clear indicators for pegs and disks (true if nothing is on top)
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)
    ;; stage marker and successor relation to enforce ordered discrete time
    (current ?s - step)
    (succ ?s1 - step ?s2 - step)
    ;; static size ordering: true if ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move top disk from a peg to another empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (succ ?s1 ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      ;; update support relations
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      ;; occupancy changes
      (not (clear-peg ?to))
      (clear-peg ?from)
      ;; stage advancement
      (not (current ?s1))
      (current ?s2)
    )
  )

  ;; Move top disk from a peg onto a larger top disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (succ ?s1 ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; update support relations
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      ;; occupancy changes
      (not (clear-disk ?to))
      (clear-peg ?from)
      ;; stage advancement
      (not (current ?s1))
      (current ?s2)
    )
  )

  ;; Move top disk from a disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (succ ?s1 ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      ;; update support relations
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      ;; occupancy changes
      (not (clear-peg ?to))
      (clear-disk ?from)
      ;; stage advancement
      (not (current ?s1))
      (current ?s2)
    )
  )

  ;; Move top disk from a disk onto a larger top disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (succ ?s1 ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; update support relations
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      ;; occupancy changes
      (not (clear-disk ?to))
      (clear-disk ?from)
      ;; stage advancement
      (not (current ?s1))
      (current ?s2)
    )
  )
)