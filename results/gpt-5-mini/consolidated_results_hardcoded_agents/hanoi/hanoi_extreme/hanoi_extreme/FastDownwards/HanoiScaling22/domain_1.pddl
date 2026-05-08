(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage - object)

  (:predicates
    ; disk placed directly on an object (peg or disk). Using object as the supertype so pegs and disks are valid supports.
    (on ?d - disk ?s - object)

    ; nothing is sitting on this object (for pegs: means empty; for disks: means no disk on top)
    (clear ?o - object)

    ; static size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ; explicit discrete stage/time progression
    (next ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  ; Move a top disk (it must be clear) from any support ?from to an empty peg ?to.
  ; This action consumes the current stage token and produces the next stage token.
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

  ; Move a top disk onto another disk ?to. Destination disk must be clear and strictly larger.
  ; This action also advances the stage.
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