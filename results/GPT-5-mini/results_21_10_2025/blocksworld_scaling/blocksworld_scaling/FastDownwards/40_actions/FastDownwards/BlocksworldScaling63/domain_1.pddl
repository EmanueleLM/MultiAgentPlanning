(define (domain BlocksworldScaling63)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table - place)

  (:predicates
    (on ?b - block ?p - place)    ; block ?b is directly on place (block or table) ?p
    (clear ?p - place)            ; place ?p (block or table) has nothing on it
    (vowel ?b - block)            ; block is a vowel-block (movable only by vowel-agent)
    (consonant ?b - block)        ; block is a consonant-block (movable only by consonant-agent)
  )

  ;; Vowel agent moves (only vowel-labeled blocks)
  (:action vowel-move
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)       ; ?b must be top of its stack (no block on top of it)
      (clear ?to)      ; destination place must be free (top)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)      ; leaving ?from makes it clear
      (not (clear ?to))  ; placing on ?to makes it not clear
    )
  )

  ;; Consonant agent moves (only consonant-labeled blocks)
  (:action consonant-move
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)       ; ?b must be top of its stack (no block on top of it)
      (clear ?to)      ; destination place must be free (top)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)      ; leaving ?from makes it clear
      (not (clear ?to))  ; placing on ?to makes it not clear
    )
  )
)