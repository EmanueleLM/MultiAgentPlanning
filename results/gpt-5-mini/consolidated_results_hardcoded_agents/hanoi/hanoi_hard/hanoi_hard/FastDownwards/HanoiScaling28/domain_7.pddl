(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)         ; disk directly on a peg (bottom-most relation for that peg)
    (on-disk ?d - disk ?below - disk)  ; disk directly on another disk
    (top ?d - disk ?p - peg)           ; disk is the top disk of peg p
    (clear ?d - disk)                  ; nothing on top of this disk
    (peg-empty ?p - peg)               ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; static size ordering: d1 smaller than d2
    (at-stage ?s - stage)              ; current stage/timepoint (unique)
    (succ ?s1 - stage ?s2 - stage)     ; immediate successor relation between stages
  )

  ;; Move a disk that is directly on a peg to an empty peg (disk was sole disk on its peg)
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

  ;; Move a disk that is directly on a peg onto another top disk on a peg (disk was sole disk on its peg)
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
      (peg-empty ?from)
      (not (peg-empty ?to))
      (not (clear ?tgt))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is on another disk (and is the top disk of its peg) to an empty peg
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
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (top ?below ?from)
      (clear ?below)
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
      (top ?d ?from)
      (clear ?d)
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
      (not (peg-empty ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)