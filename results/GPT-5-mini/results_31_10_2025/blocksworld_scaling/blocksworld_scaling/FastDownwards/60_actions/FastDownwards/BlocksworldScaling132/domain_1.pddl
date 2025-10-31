(define (domain blocks-vowel-consonant)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?x - block)      ; ?b is directly on block ?x
    (ontable ?b - block)            ; ?b is directly on the table
    (clear ?b - block)              ; nothing on top of ?b
    (vowel ?b - block)              ; ?b is a vowel-controlled block
    (consonant ?b - block)          ; ?b is a consonant-controlled block
  )

  ;; Vowel agent actions (may move only vowel-labeled top blocks)
  (:action move-vowel-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Consonant agent actions (may move only consonant-labeled top blocks)
  (:action move-consonant-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action move-consonant-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )
)