(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-disk ?d - disk ?e - disk)        ; disk ?d directly on disk ?e
    (on-peg ?d - disk ?p - peg)          ; disk ?d directly on peg ?p
    (at ?d - disk ?p - peg)              ; disk ?d is located on peg ?p (belongs to that peg)
    (clear ?d - disk)                    ; nothing on top of disk ?d
    (empty ?p - peg)                     ; peg ?p has no disks
    (smaller ?d1 - disk ?d2 - disk)      ; ?d1 is smaller than ?d2
  )

  ;; Move a disk that is directly on a peg to an empty peg
  (:action move-onpeg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (at ?d ?from))
      (on-peg ?d ?to)
      (at ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; Move a disk that is on another disk to an empty peg
  (:action move-ondisk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (at ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (at ?d ?from))
      (at ?d ?to)
      (not (empty ?to))
      (clear ?below)
    )
  )

  ;; Move a disk that is directly on a peg onto another disk (destination peg non-empty)
  (:action move-onpeg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?top)
      (at ?top ?to)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (at ?d ?from))
      (on-disk ?d ?top)
      (at ?d ?to)
      (not (clear ?top))
      (clear ?d)
      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; Move a disk that is on another disk onto another disk (both pegs known)
  (:action move-ondisk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?top)
      (at ?d ?from)
      (at ?top ?to)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?top)
      (not (clear ?top))
      (clear ?below)
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )
)