(define (domain multiagent-blocks)
  ; Multi-agent blocks domain integrating vowel and consonant mover capabilities.
  (:requirements :strips :typing :negative-preconditions)
  (:types place spot block - place)

  (:predicates
    (on ?b - block ?p - place)    ; block ?b is directly on place ?p (place may be a spot or another block)
    (clear ?p - place)            ; place ?p has no block on top of it (i.e., is top of a stack or empty spot)
    (vowel ?b - block)            ; block is vowel (A E I O)
    (consonant ?b - block)        ; block is consonant
  )

  ; Vowel agent move: move a top vowel block from one place to another (to a clear place).
  (:action move-vowel
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)                 ; ?b must be top of its stack
      (clear ?to)                ; destination must be clear (empty spot or top block)
      (not (= ?from ?to))
      (not (= ?to ?b))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)              ; source place becomes clear after removing top block
      (not (clear ?to))          ; destination is now occupied (no longer clear)
      (clear ?b)                 ; moved block is top of its new stack
    )
  )

  ; Consonant agent move: move a top consonant block from one place to another (to a clear place).
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