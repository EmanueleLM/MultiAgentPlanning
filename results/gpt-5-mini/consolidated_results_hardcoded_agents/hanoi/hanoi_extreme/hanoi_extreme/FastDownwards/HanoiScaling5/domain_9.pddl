(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (onpeg ?d - disk ?p - peg)      ; disk directly on peg
    (ondisk ?d - disk ?below - disk) ; disk directly on another disk
    (clear-peg ?p - peg)            ; peg has no disk on it
    (clear-disk ?d - disk)          ; no disk on top of this disk
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    (step ?s - step)
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move top disk from a peg to another peg
  (:action move_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (onpeg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (onpeg ?d ?from))
      (onpeg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move top disk from a peg onto a larger disk
  (:action move_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (onpeg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (onpeg ?d ?from))
      (ondisk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move top disk from on top of another disk to a peg
  (:action move_disk_to_peg
    :parameters (?d - disk ?below - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (ondisk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (ondisk ?d ?below))
      (onpeg ?d ?to)
      (clear-disk ?below)
      (not (clear-peg ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move top disk from on top of another disk onto a larger disk
  (:action move_disk_to_disk
    :parameters (?d - disk ?below - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (ondisk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (ondisk ?d ?below))
      (ondisk ?d ?to)
      (clear-disk ?below)
      (not (clear-disk ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)