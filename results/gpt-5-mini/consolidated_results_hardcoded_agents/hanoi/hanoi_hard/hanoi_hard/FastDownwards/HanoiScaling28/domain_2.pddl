(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk location: directly on a peg or directly on another disk
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?below - disk)

    ;; the disk ?d is the top disk of peg ?p (regardless of whether it is directly on the peg
    ;; or on top of a stack that rests on that peg)
    (top ?d - disk ?p - peg)

    ;; there is no disk on top of ?d
    (clear ?d - disk)

    ;; peg has no disks
    (peg-empty ?p - peg)

    ;; size ordering (static)
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete stage control to enforce one move per stage and contiguous progression
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a disk that is directly on a peg to an empty peg (the disk is the top of the source peg).
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (clear ?d)
      (peg-empty ?to)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; relocate ?d from source peg to target peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update top-of-peg markers
      (not (top ?d ?from))
      (top ?d ?to)

      ;; source peg becomes empty, target peg no longer empty
      (peg-empty ?from)
      (not (peg-empty ?to))

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is directly on a peg to sit on top of another disk (target peg non-empty).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?tgt - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (clear ?d)
      (top ?tgt ?to)
      (smaller ?d ?tgt)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; relocate ?d from being on the peg to being on top of tgt
      (not (on-peg ?d ?from))
      (on-disk ?d ?tgt)

      ;; update top markers: remove d from source peg, make d the top of target peg,
      ;; and remove target's previous top marker
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?tgt ?to))

      ;; the target disk is no longer clear
      (not (clear ?tgt))

      ;; source peg may become empty (since ?d was directly on the peg)
      (peg-empty ?from)

      ;; ensure target peg not marked empty (delete if present)
      (not (peg-empty ?to))

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (top ?d ?from)
      (peg-empty ?to)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove direct-on relation and place ?d on the empty peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; update top-of-peg markers: remove d from source peg, make d top of destination
      (not (top ?d ?from))
      (top ?d ?to)

      ;; the disk that was below now becomes the top of the source peg and becomes clear
      (top ?below ?from)
      (clear ?below)

      ;; target peg is no longer empty
      (not (peg-empty ?to))

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is directly on another disk to sit on top of a different disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?tgt - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (top ?d ?from)
      (top ?tgt ?to)
      (smaller ?d ?tgt)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; relocate ?d to be on top of tgt
      (not (on-disk ?d ?below))
      (on-disk ?d ?tgt)

      ;; update top markers: remove d from source peg, make d top of target, remove previous target top
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?tgt ?to))

      ;; the disk below becomes clear
      (clear ?below)

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)