(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)

  (:types disk peg stage)

  (:predicates
    ; disk directly on a peg (bottom-most disk of a peg)
    (on-peg ?d - disk ?p - peg)
    ; disk directly on another disk (support relation)
    (on-disk ?d - disk ?support - disk)

    ; clear predicates: nothing on top of the peg/disk
    (clear-peg ?p - peg)   ; true iff peg has no disks
    (clear-disk ?d - disk) ; true iff nothing is on top of this disk

    ; explicit discrete stage control (single action per stage)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)

    ; static size ordering: true if ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; Actions (origin: mover)
  ; Move top disk that is alone on a peg to another empty peg.
  (:action mover-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (on-peg ?d ?from)     ; disk is directly on source peg
      (clear-disk ?d)       ; disk is top on that peg

      (clear-peg ?to)       ; destination peg is empty
    )
    :effect (and
      ; placement update
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ; clear/top facts
      (not (clear-peg ?to)) ; destination peg now occupied
      (clear-peg ?from)     ; source peg becomes empty
      (clear-disk ?d)       ; moved disk is top-most on destination peg

      ; advance stage (enforce one action per stage)
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Move top disk from on top of another disk onto an empty peg.
  (:action mover-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (on-disk ?d ?from)    ; disk is on top of another disk
      (clear-disk ?d)       ; moved disk is top-most on its peg

      (clear-peg ?to)       ; destination peg empty
    )
    :effect (and
      ; placement update
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ; clear/top facts
      (not (clear-peg ?to)) ; destination peg no longer empty
      (clear-disk ?from)    ; former supporting disk becomes top-most
      (clear-disk ?d)       ; moved disk is top-most on destination peg

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Move top disk that is alone on a peg onto a top disk of another peg (must be smaller).
  (:action mover-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (on-peg ?d ?from)     ; disk directly on source peg (and top on that peg)
      (clear-disk ?d)

      (clear-disk ?to)      ; target disk is top-most on its peg
      (smaller ?d ?to)      ; moved disk must be smaller
    )
    :effect (and
      ; placement update
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ; clear/top facts
      (not (clear-disk ?to)) ; target disk now has a disk on top
      (clear-peg ?from)      ; source peg becomes empty
      (clear-disk ?d)        ; moved disk is top-most

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Move top disk from a disk onto another top disk (must be smaller).
  (:action mover-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (on-disk ?d ?from)    ; disk is directly on its support
      (clear-disk ?d)       ; moved disk is top-most

      (clear-disk ?to)      ; target disk is top-most
      (smaller ?d ?to)      ; must be smaller
    )
    :effect (and
      ; placement update
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ; clear/top facts
      (not (clear-disk ?to)) ; target disk no longer clear
      (clear-disk ?from)     ; former support disk becomes top-most
      (clear-disk ?d)        ; moved disk is top-most

      ; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

)