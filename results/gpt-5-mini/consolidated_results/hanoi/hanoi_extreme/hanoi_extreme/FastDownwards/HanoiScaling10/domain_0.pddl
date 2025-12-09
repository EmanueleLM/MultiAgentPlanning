(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types support disk peg)

  (:predicates
    (on ?d - disk ?s - support)      ; disk ?d is directly on support ?s (a disk or a peg)
    (clear ?s - support)            ; nothing is on top of support ?s
    (smaller ?x - disk ?y - disk)   ; disk ?x is strictly smaller than disk ?y
  )

  ;; Move a clear disk from some support onto an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?peg - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
      (not (= ?from ?peg))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)        ; the former support becomes clear (the disk above it was removed)
      (not (clear ?peg))   ; the peg is no longer clear (it now has ?d on it)
    )
  )

  ;; Move a clear disk from some support onto a clear disk that is strictly larger.
  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?target - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (smaller ?d ?target)
      (not (= ?from ?target))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear ?from)           ; the former support becomes clear after removal
      (not (clear ?target))   ; the target disk is no longer clear (it now has ?d on it)
    )
  )
)