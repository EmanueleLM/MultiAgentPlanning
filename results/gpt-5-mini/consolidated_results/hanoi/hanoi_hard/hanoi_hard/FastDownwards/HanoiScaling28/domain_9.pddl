(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; relational state
    (on-peg ?d - disk ?p - peg)        ;; disk directly on a peg (no disk below)
    (on-disk ?d - disk ?below - disk) ;; disk directly on another disk
    (top ?d - disk ?p - peg)          ;; disk is the top disk of peg ?p
    (clear ?d - disk)                 ;; no disk on top of ?d
    (peg-empty ?p - peg)              ;; peg has no disks
    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)
    ;; stage progression (discrete time)
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a disk that is currently directly on a peg to an empty target peg.
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
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update top-of-pegs
      (not (top ?d ?from))
      (top ?d ?to)

      ;; source peg becomes empty, target peg not empty
      (peg-empty ?from)
      (not (peg-empty ?to))

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is currently directly on a peg to be on top of another disk (target disk is top of its peg).
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
      ;; relocate d onto tgt
      (not (on-peg ?d ?from))
      (on-disk ?d ?tgt)

      ;; update top relations
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?tgt ?to))

      ;; peg occupancy flags
      (peg-empty ?from)
      (not (peg-empty ?to))

      ;; target disk is no longer clear
      (not (clear ?tgt))

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is currently directly on another disk to an empty target peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (clear ?d)
      (peg-empty ?to)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; relocate d to empty peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; update top relations: d no longer top of source; d becomes top of target
      (not (top ?d ?from))
      (top ?d ?to)

      ;; the disk below becomes top of source and becomes clear
      (top ?below ?from)
      (clear ?below)

      ;; target peg now non-empty
      (not (peg-empty ?to))

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is currently directly on another disk to be on top of another target disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?tgt - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (clear ?d)
      (top ?tgt ?to)
      (smaller ?d ?tgt)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; relocate d onto tgt
      (not (on-disk ?d ?below))
      (on-disk ?d ?tgt)

      ;; update top relations
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?tgt ?to))

      ;; the disk below becomes top and clear
      (top ?below ?from)
      (clear ?below)

      ;; target disk no longer clear
      (not (clear ?tgt))

      ;; target peg remains non-empty (source remains non-empty since below stays)
      (not (peg-empty ?to))

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)