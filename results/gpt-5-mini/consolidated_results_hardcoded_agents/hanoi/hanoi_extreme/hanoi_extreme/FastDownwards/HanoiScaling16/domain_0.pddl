(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; Disk and peg relations
    (on-peg ?d - disk ?p - peg)        ; disk ?d directly on peg ?p
    (on-disk ?d - disk ?below - disk) ; disk ?d directly on top of disk ?below
    (top ?d - disk)                    ; disk ?d is the top disk of its current stack
    (empty ?p - peg)                   ; peg ?p currently has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; disk ?d1 is strictly smaller than disk ?d2
  )

  ;; Move a top disk from one peg to an empty peg
  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d)
      (on-peg ?d ?from)
      (empty ?to)
      (not (on-peg ?d ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; Move a top disk from on top of another disk to an empty peg
  (:action move-disk-to-peg-empty
    :parameters (?d - disk ?below - disk ?to - peg)
    :precondition (and
      (top ?d)
      (on-disk ?d ?below)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (empty ?to))
      ;; the disk that was directly below ?d becomes the top of its stack
      (top ?below)
    )
  )

  ;; Move a top disk from a peg onto another top disk (target disk must be larger)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?v - disk)
    :precondition (and
      (top ?d)
      (on-peg ?d ?from)
      (top ?v)
      (smaller ?d ?v)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?v)
      (not (top ?v))
      (empty ?from)
    )
  )

  ;; Move a top disk from on top of one disk onto another top disk (target disk must be larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?v - disk)
    :precondition (and
      (top ?d)
      (on-disk ?d ?below)
      (top ?v)
      (smaller ?d ?v)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?v)
      (not (top ?v))
      ;; the disk that was directly below ?d becomes the top of its stack
      (top ?below)
    )
  )
)