(define (domain hanoi-consistent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; positional relations
    (on-peg ?d - disk ?p - peg)        ; disk is directly on a peg (the disk directly touching the peg)
    (on-disk ?d - disk ?below - disk)  ; disk is directly on another disk (d is immediately above below)
    ;; top / empty markers
    (clear-peg ?p - peg)               ; peg has no disks
    (clear-disk ?d - disk)             ; no disk on top of this disk (it is a top disk)
    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2
    ;; discrete stage progression (enforce exactly one action per stage and contiguous progression)
    (at-stage ?s - stage)              ; current stage marker
    (next ?s1 - stage ?s2 - stage)     ; successor relation between stages
  )

  ;; Move a disk that is directly on a peg to an empty peg.
  ;; This action applies only when the disk is the top disk on its peg (clear-disk),
  ;; and the destination peg is empty (clear-peg). Stage successor enforces ordered single-step progression.
  (:action move_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is directly on a peg onto a disk (stack onto an existing top disk).
  (:action move_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)    ; moved disk must be top on its peg
      (clear-disk ?to)   ; target disk must be top on its stack
      (smaller ?d ?to)   ; respect size ordering
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)      ; source peg becomes empty (since moved disk was the only one touching peg)
      (not (clear-disk ?to)) ; target disk no longer top
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg.
  (:action move_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)    ; moved disk must be top
      (clear-peg ?to)    ; destination peg must be empty
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)     ; disk below becomes top
      (not (clear-peg ?to))  ; destination peg is no longer empty
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is directly on another disk onto another disk.
  (:action move_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)     ; disk below becomes top
      (not (clear-disk ?to)) ; target disk no longer top
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)