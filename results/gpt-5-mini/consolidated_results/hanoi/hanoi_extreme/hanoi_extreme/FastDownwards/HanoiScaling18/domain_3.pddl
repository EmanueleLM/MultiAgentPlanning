(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk is directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk is directly on another disk
    (on-disk ?d - disk ?p - disk)

    ;; nothing directly on this peg / disk (i.e., it is the top)
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; size ordering: ?big is strictly larger than ?small
    (larger ?big - disk ?small - disk)

    ;; stage progression
    (current ?s - step)
    (succ ?s - step ?s2 - step)
  )

  ;; Move a top disk from a peg to another peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a peg onto a top disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a disk to a peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a disk onto another disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)