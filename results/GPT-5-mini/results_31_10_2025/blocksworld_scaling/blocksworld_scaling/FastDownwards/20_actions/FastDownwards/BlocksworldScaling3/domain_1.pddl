(define (domain BlocksworldScaling3)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table - place)

  (:predicates
    (on ?b - block ?p - place)     ; block ?b is on place ?p (either a block or the table)
    (clear ?b - block)             ; nothing on top of block ?b
    (vowel ?b - block)             ; block is a vowel (moved only by vowel_agent)
    (consonant ?b - block)         ; block is a consonant (moved only by consonant_agent)
  )

  ;; Vowel agent actions (only moves blocks marked (vowel ?b))
  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?b)
            )
  )

  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (on ?b table) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b table))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b table)
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Consonant agent actions (only moves blocks marked (consonant ?b))
  (:action cons-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?b)
            )
  )

  (:action cons-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (on ?b table) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b table))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action cons-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b table)
              (clear ?from)
              (clear ?b)
            )
  )
)