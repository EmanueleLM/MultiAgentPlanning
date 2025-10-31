(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - placeable)

  (:predicates
    (on ?d - disk ?p - placeable)    ; disk ?d is directly on placeable ?p (disk or peg)
    (clear ?p - placeable)          ; nothing on top of ?p (top disk or peg is empty)
    (smaller ?d - disk ?p - placeable) ; ?d is smaller than placeable ?p (peg considered larger than any disk)
  )

  ; Move a top disk from one placeable (disk or peg) to another placeable (disk or peg)
  (:action move
    :parameters (?d - disk ?from - placeable ?to - placeable)
    :precondition (and
      (on ?d ?from)      ; ?d is directly on ?from
      (clear ?d)         ; nothing on top of ?d (so ?d is top)
      (clear ?to)        ; destination top is clear (either an empty peg or a top disk)
      (smaller ?d ?to)   ; size rule: moving disk must be smaller than destination support
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ; after removing the top disk, the support becomes clear (the disk below, if any, will be represented via existing on facts)
      (not (clear ?to))  ; destination support is no longer clear (it has ?d on top)
    )
  )
)