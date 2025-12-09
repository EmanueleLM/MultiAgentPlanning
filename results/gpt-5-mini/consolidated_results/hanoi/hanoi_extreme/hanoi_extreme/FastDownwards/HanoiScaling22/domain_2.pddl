(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage - object)

  (:predicates
    (on ?d - disk ?s - object)           ; disk ?d is directly on object ?s (peg or disk)
    (clear ?o - object)                 ; no disk is on top of object ?o (peg or disk)
    (smaller ?x - disk ?y - disk)       ; static size ordering: ?x is strictly smaller than ?y
    (next ?s - stage ?s2 - stage)       ; discrete step successor relation
    (current ?s - stage)                ; which stage is the current one
  )

  ;; Move a top disk from a support (peg or disk) to an empty peg.
  ;; Advances the current stage to its successor; enforces top-of-stack and empty-destination constraints.
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (clear ?to))
      (clear ?from)

      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a support (peg or disk) onto another disk.
  ;; Destination disk must be clear and strictly larger than the moved disk.
  ;; Advances the current stage to its successor.
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (clear ?to))
      (clear ?from)

      (not (current ?s))
      (current ?s2)
    )
  )
)