(define (domain hanoi)
  :requirements :strips :typing :negative-preconditions
  :types disk peg - place step

  :predicates
    ; disk is on a place (either a peg or another disk)
    (on ?d - disk ?p - place)
    ; a place (peg or disk) has nothing on top
    (clear ?p - place)
    ; disk ?d is smaller than place ?p (either a disk larger than it or an empty peg)
    (smaller ?d - disk ?p - place)
    ; ordered step relation for enforcing contiguous move sequence
    (next ?a - step ?b - step)
    (used ?s - step)
    (first ?s - step)
  )

  (:action move-first
    :parameters (?d - disk ?from - place ?to - place ?st - step)
    :precondition (and
      (on ?d ?from)         ; disk is on its support
      (clear ?d)            ; disk has no disk on top (is top)
      (clear ?to)           ; target place has nothing on top (peg empty or target disk has nothing on top)
      (smaller ?d ?to)      ; size constraint: moving disk fits on target
      (first ?st)
      (not (used ?st))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)         ; the support where disk was becomes clear (no disk immediately on it)
      (not (clear ?to))     ; target is no longer clear (it now has ?d on top)
      (used ?st)
    )
  )

  (:action move-next
    :parameters (?d - disk ?from - place ?to - place ?prev - step ?st - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (next ?prev ?st)
      (used ?prev)
      (not (used ?st))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (used ?st)
    )
  )
)