(define (domain combined-blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)      ; ?x is directly on top of ?y
    (ontable ?x - block)            ; ?x is on the table
    (clear ?x - block)              ; nothing on top of ?x
    (vowel ?x - block)              ; ?x is a vowel-labeled block (movable by vowel agent)
    (consonant ?x - block)          ; ?x is a consonant-labeled block (movable by consonant agent)
  )

  ;; Actions belonging to the vowel_agent (preserve agent ownership)
  (:action move-vowel-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (on ?b ?to)
      (clear ?from)
      (not (on ?b ?from))
      (not (clear ?to))
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (on ?b ?to)
      (not (ontable ?b))
      (not (clear ?to))
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (ontable ?b)
      (clear ?from)
      (not (on ?b ?from))
    )
  )

  ;; Actions belonging to the consonant_agent (kept distinct; renamed to clarify ownership)
  (:action move-consonant-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-consonant-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)