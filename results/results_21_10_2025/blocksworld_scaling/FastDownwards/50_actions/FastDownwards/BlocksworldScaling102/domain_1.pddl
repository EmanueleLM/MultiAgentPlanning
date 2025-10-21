(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block place entity)
  (:predicates
    (on ?b - block ?x - entity)    ; block b is directly on entity x (block or place)
    (clear ?b - block)             ; no block on top of b
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ; -------------------------
  ; Vowel-agent actions (can move only vowel-labelled blocks A,E,I)
  ; Only top blocks can be moved; destination block must be clear.
  ; Four variants to handle block/place source and block/place destination.
  ; -------------------------

  (:action vowel_move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action vowel_move-place-to-block
    :parameters (?b - block ?from - place ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel_move-block-to-place
    :parameters (?b - block ?from - block ?place - place)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?place)
      (clear ?from)
    )
  )

  (:action vowel_move-place-to-place
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
    )
  )

  ; -------------------------
  ; Consonant-agent actions (all other letters)
  ; -------------------------

  (:action consonant_move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action consonant_move-place-to-block
    :parameters (?b - block ?from - place ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant_move-block-to-place
    :parameters (?b - block ?from - block ?place - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?place)
      (clear ?from)
    )
  )

  (:action consonant_move-place-to-place
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
    )
  )

)