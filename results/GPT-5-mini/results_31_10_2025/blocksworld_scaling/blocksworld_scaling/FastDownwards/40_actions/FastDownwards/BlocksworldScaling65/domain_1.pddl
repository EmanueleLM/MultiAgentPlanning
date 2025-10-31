(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stack - place)

  (:predicates
    (on ?b - block ?p - place)      ; block ?b is directly on place ?p (place = block or stack)
    (clear ?p - place)              ; nothing on top of place ?p (p can be a block or a stack)
    (vowel ?b - block)              ; block is vowel-controlled
    (consonant ?b - block)          ; block is consonant-controlled
  )

  ; Vowel agent: may move only vowel blocks. Can place them on any place (block or stack).
  (:action vowel_move
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Consonant agent: may move only consonant blocks. Can place them on any place (block or stack).
  (:action cons_move
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)