(define (domain hanoi-consistent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk is directly on a peg (only for bottom-most disk of that peg)
    (on-disk ?d - disk ?below - disk)  ; disk is directly on another disk
    (clear-peg ?p - peg)               ; peg has no disks
    (clear-disk ?d - disk)             ; no disk on top of this disk
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2
    (at-stage ?s - stage)              ; current stage marker
    (next ?s1 - stage ?s2 - stage)     ; successor relation between stages
  )

  ;; Move a disk that is directly on a peg to an empty peg.
  (:action move_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)    ; must be top disk on that peg (no disk above)
      (clear-peg ?to)    ; destination peg must be empty
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)      ; source peg becomes empty
      (not (clear-peg ?to))  ; destination peg is no longer empty
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is directly on a peg onto a disk (stack onto an existing disk).
  (:action move_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)     ; target disk must have no disk above
      (smaller ?d ?to)     ; respect size ordering
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)      ; source peg becomes empty
      (not (clear-disk ?to)) ; target disk now has a disk on top
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg.
  (:action move_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)     ; the disk below becomes clear
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
      (clear-disk ?from)
      (not (clear-disk ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)