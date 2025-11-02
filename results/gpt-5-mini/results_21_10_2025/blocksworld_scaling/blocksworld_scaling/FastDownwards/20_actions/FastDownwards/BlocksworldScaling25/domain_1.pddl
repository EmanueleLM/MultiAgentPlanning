(define (domain blocksworld-scaling25)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    block place - object
    vowel consonant - block
  )

  (:predicates
    ;; a block is on some object (either another block or a place)
    (on ?b - block ?x - object)
    ;; a block has nothing on top of it
    (clear ?b - block)
  )

  ;; Vowel-agent actions: can only move vowel-typed blocks (A, E, I)
  (:action vowel-move-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-place
    :parameters (?b - vowel ?from - block ?to - place)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
    )
  )

  (:action vowel-move-place-to-block
    :parameters (?b - vowel ?from - place ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Consonant-agent actions: can only move consonant-typed blocks (B,C,D,F,G,H,J)
  (:action consonant-move-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-place
    :parameters (?b - consonant ?from - block ?to - place)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
    )
  )

  (:action consonant-move-place-to-block
    :parameters (?b - consonant ?from - place ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )
)