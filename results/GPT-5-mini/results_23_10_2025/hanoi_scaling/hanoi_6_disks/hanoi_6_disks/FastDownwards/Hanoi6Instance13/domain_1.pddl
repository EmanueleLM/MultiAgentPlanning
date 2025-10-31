(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - placeable)

  (:predicates
    ;; disk is directly on a placeable object (disk or peg)
    (on ?d - disk ?p - placeable)
    ;; nothing on top of the placeable object (top-most disk or empty peg)
    (clear ?p - placeable)
    ;; size relation: ?d is smaller than ?p (either a larger disk or any peg)
    (smaller ?d - disk ?p - placeable)
  )

  ;; Move a top disk from its immediate support (?from) to a destination support (?to).
  ;; Both supports can be pegs or disks (placeable).
  (:action move
    :parameters (?d - disk ?from - placeable ?to - placeable)
    :precondition (and
      (on ?d ?from)        ; ?d is directly on ?from
      (clear ?d)           ; ?d has nothing on top (is the top disk)
      (clear ?to)          ; destination top is clear (empty peg or top disk)
      (smaller ?d ?to)     ; size rule: moving disk must be smaller than destination support
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ; after removing ?d, its former support becomes clear
      (not (clear ?to))    ; destination support is no longer clear (it has ?d on top)
    )
  )
)