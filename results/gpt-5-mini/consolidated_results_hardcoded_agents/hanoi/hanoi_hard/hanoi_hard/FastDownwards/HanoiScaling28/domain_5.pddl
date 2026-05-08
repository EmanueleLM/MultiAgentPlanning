(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)         ; disk directly on peg (i.e. bottom-most disk)
    (on-disk ?d - disk ?below - disk)  ; disk directly on another disk
    (top ?d - disk ?p - peg)           ; disk is the top disk of peg p
    (clear ?d - disk)                  ; no disk is on top of this disk
    (peg-empty ?p - peg)               ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2
    (at-stage ?s - stage)              ; current stage/timepoint
    (succ ?s1 - stage ?s2 - stage)     ; s2 is the immediate successor of s1
  )

  ;; Move a disk that is directly on a peg to an empty peg
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
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (peg-empty ?from)
      (not (peg-empty ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is directly on a peg onto another top disk on a peg
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
      (not (on-peg ?d ?from))
      (on-disk ?d ?tgt)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?tgt ?to))
      (not (clear ?tgt))
      (peg-empty ?from)
      (not (peg-empty ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is on another disk (and is the top disk of its peg) to an empty peg
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
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (top ?below ?from)
      (clear ?below)
      (not (clear ?d))
      (not (peg-empty ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is on another disk (and is the top disk of its peg) onto another top disk on a peg
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
      (not (on-disk ?d ?below))
      (on-disk ?d ?tgt)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?tgt ?to))
      (top ?below ?from)
      (clear ?below)
      (not (clear ?tgt))
      (not (clear ?d))
      (not (peg-empty ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)