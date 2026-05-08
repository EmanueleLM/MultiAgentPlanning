(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)     ; disk is directly on a peg (bottom disk)
    (on-disk ?d - disk ?s - disk)   ; disk is directly on another disk

    (top ?d - disk ?p - peg)        ; disk is the top disk on peg
    (clear-peg ?p - peg)            ; peg has no disks
    (clear-disk ?d - disk)          ; no disk is on this disk (it is a top)

    (smaller ?d1 - disk ?d2 - disk) ; size ordering: d1 < d2

    (current ?t - stage)            ; current discrete stage
    (succ ?t1 - stage ?t2 - stage)  ; successor relation between stages
  )

  ; Move a top disk that is directly supported by another disk onto a non-empty peg (onto its top disk)
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?top - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (top ?top ?to)
      (smaller ?d ?top)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; advance stage
      (not (current ?s))
      (current ?s2)

      ; remove moved disk from its current immediate support and its top status on its from-peg
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ; expose the disk that was below on the from-peg: it becomes the top and is clear
      (top ?below ?from)
      (clear-disk ?below)

      ; update the destination: previous top is no longer top and is no longer clear
      (not (top ?top ?to))
      (not (clear-disk ?top))

      ; placed disk becomes directly on the previous top of destination and becomes the new top and is clear
      (on-disk ?d ?top)
      (top ?d ?to)
      (clear-disk ?d)
    )
  )

  ; Move a top disk that is directly supported by another disk onto an empty peg
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (clear-peg ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; advance stage
      (not (current ?s))
      (current ?s2)

      ; remove moved-disk from its current immediate support and its top status on its from-peg
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ; expose the disk that was below on the from-peg: it becomes the top and is clear
      (top ?below ?from)
      (clear-disk ?below)

      ; destination: peg becomes non-empty and receives the moved disk directly on the peg
      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
      (clear-disk ?d)
    )
  )

  ; Move a top disk that is directly on a peg onto a non-empty peg (onto its top disk)
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?top - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?top ?to)
      (smaller ?d ?top)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; advance stage
      (not (current ?s))
      (current ?s2)

      ; remove moved-disk from its current peg support and its top status
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ; from-peg becomes empty
      (clear-peg ?from)

      ; destination: previous top is no longer top and no longer clear
      (not (top ?top ?to))
      (not (clear-disk ?top))

      ; moved disk becomes directly on the previous top and the new top and is clear
      (on-disk ?d ?top)
      (top ?d ?to)
      (clear-disk ?d)
    )
  )

  ; Move a top disk that is directly on a peg onto an empty peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (clear-peg ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; advance stage
      (not (current ?s))
      (current ?s2)

      ; remove moved-disk from its current peg support and its top status
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ; from-peg becomes empty
      (clear-peg ?from)

      ; destination: peg becomes non-empty with moved disk on it; disk is clear (top)
      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
      (clear-disk ?d)
    )
  )
)