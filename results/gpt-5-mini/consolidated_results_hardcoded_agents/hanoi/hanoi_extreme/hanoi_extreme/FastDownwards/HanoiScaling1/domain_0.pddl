(define (domain hanoi7)
  (:requirements :strips :typing)
  (:types disk peg)

  (:predicates
    ; immediate-support predicates
    (on-peg ?d - disk ?p - peg)     ; disk is directly on peg
    (on-disk ?d - disk ?s - disk)   ; disk is directly on another disk

    ; top/clear predicates
    (top ?d - disk ?p - peg)        ; disk is the top disk on peg
    (clear-peg ?p - peg)            ; peg has no disks
    (clear-disk ?d - disk)          ; no disk is on this disk (it is clear / top)

    ; static size ordering
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; Move a top disk that is directly supported by another disk onto a non-empty peg (onto its top disk)
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?top - disk)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (top ?top ?to)
      (smaller ?d ?top)
    )
    :effect (and
      ; remove moved-disk from its current immediate support
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ; update the from-peg: the disk that was below becomes the top and becomes clear
      (top ?below ?from)
      (clear-disk ?below)

      ; update the to-peg: previous top is no longer top and no longer clear
      (not (top ?top ?to))
      (not (clear-disk ?top))

      ; moved disk becomes directly on the previous top of destination and becomes the new top
      (on-disk ?d ?top)
      (top ?d ?to)
    )
  )

  ; Move a top disk that is directly supported by another disk onto an empty peg
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (clear-peg ?to)
    )
    :effect (and
      ; remove moved-disk from its current immediate support
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ; update the from-peg: the disk that was below becomes the top and becomes clear
      (top ?below ?from)
      (clear-disk ?below)

      ; update the to-peg: it becomes non-empty and receives the moved disk directly on the peg
      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )

  ; Move a top disk that is directly on a peg onto a non-empty peg (onto its top disk)
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?top ?to)
      (smaller ?d ?top)
    )
    :effect (and
      ; remove moved-disk from its current peg support
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ; from-peg becomes empty
      (clear-peg ?from)

      ; destination: previous top is no longer top and no longer clear
      (not (top ?top ?to))
      (not (clear-disk ?top))

      ; moved disk becomes directly on the previous top and the new top
      (on-disk ?d ?top)
      (top ?d ?to)
    )
  )

  ; Move a top disk that is directly on a peg onto an empty peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (clear-peg ?to)
    )
    :effect (and
      ; remove moved-disk from its current peg support
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ; from-peg becomes empty
      (clear-peg ?from)

      ; destination: peg becomes non-empty with moved disk on it
      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )
)