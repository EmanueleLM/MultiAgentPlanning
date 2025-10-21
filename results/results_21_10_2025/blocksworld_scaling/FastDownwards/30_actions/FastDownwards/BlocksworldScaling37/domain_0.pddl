(define (domain multiagent-blocks)
  ; Multi-agent blocks domain integrating Vowel and Consonant agent capabilities.
  ; Actions are annotated with agent type prefixes: move-vowel and move-consonant.
  (:requirements :strips :typing :negative-preconditions)
  (:types place block - place)

  (:predicates
    (on ?b - block ?p - place)        ; block ?b is directly on place ?p (place may be a block or a table-spot)
    (clear ?p - place)                ; place ?p has no block on top of it (no block is on ?p)
    (vowel ?b - block)                ; block is a vowel (movable by the Vowel agent)
    (consonant ?b - block)            ; block is a consonant (movable by the Consonant agent)
  )

  ; Vowel agent action: can move a top vowel block from its current place to any clear destination place.
  (:action move-vowel
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)                 ; ?b must be top of its stack (no block on ?b)
      (clear ?to)                ; destination must be clear (top of its stack / empty table spot)
      (not (= ?from ?to))        ; cannot move to the same place
      (not (= ?to ?b))           ; cannot move onto itself
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)              ; the source place becomes clear after removing the top block
      (not (clear ?to))          ; the destination is now occupied (no longer clear)
      (clear ?b)                 ; moved block is top of its new stack (no block on it)
    )
  )

  ; Consonant agent action: identical movement constraints but restricted to consonants.
  (:action move-consonant
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from ?to))
      (not (= ?to ?b))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )
)