(define (domain hanoi-5-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    (on ?d - disk ?x - object)          ; ?d is directly on ?x (disk or peg)
    (clear ?x - object)                ; no disk is on top of ?x
    (smaller ?d1 - disk ?d2 - disk)    ; static size relation: ?d1 smaller than ?d2
    (succ ?s - stage ?s2 - stage)      ; stage successor relation
    (current ?s - stage)               ; the current stage at which actions may fire
  )

  ; Move a top disk from any supporting object to an empty peg (atomic, advances stage)
  (:action mover-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Move a top disk from any supporting object onto another disk (only if smaller), advances stage
  (:action mover-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)