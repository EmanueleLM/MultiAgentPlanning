(define (domain hanoi7instance3)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    ;; structural position predicates:
    (on-disk ?d - disk ?below - disk)   ;; ?d is immediately on top of disk ?below
    (on-peg  ?d - disk ?p - peg)        ;; ?d is immediately on peg ?p (i.e. disk at bottom of that peg)
    ;; top/clear predicates:
    (clear-disk ?d - disk)              ;; nothing is on top of ?d (it is the top disk of its peg)
    (clear-peg  ?p - peg)               ;; peg ?p has no disks
    ;; size ordering (static):
    (smaller ?d1 - disk ?d2 - disk)     ;; ?d1 is strictly smaller than ?d2
    ;; agent controls (keeps agent identities present as required):
    (controls ?a - agent ?p - peg)
  )

  ;; Move a top disk that is sitting on a disk onto another disk.
  (:action move-disk-to-disk
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
      ;; the disk that used to be supporting ?d becomes clear (no disk on it)
      (clear-disk ?from)
      ;; the disk ?to is no longer clear (now has ?d on top)
      (not (clear-disk ?to))
    )
  )

  ;; Move a top disk that is sitting on a disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg  ?d ?to)
      ;; the disk that used to be supporting ?d becomes clear
      (clear-disk ?from)
      ;; the target peg is no longer empty
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk that is sitting on a peg (the disk is the only disk on that peg)
  ;; onto another disk.
  (:action move-peg-to-disk
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
      ;; the source peg becomes empty
      (clear-peg ?from)
      ;; the disk ?to is no longer clear
      (not (clear-disk ?to))
    )
  )

  ;; Move a top disk that is sitting on a peg (the disk is the only disk on that peg)
  ;; onto an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg  ?d ?to)
      ;; source peg becomes empty
      (clear-peg ?from)
      ;; target peg is no longer empty
      (not (clear-peg ?to))
    )
  )
)