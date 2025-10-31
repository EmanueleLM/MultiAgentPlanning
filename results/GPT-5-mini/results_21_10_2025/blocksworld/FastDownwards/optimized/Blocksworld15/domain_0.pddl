(define (domain orchestrated_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table)

  (:predicates
    (on ?x - block ?y - block)     ; block x is on block y
    (ontable ?x - block)           ; block x is on the table
    (clear ?x - block)             ; nothing on top of block x
    (vowel ?x - block)             ; x is a vowel block (moved only by vowel agent)
    (consonant ?x - block)         ; x is a consonant block (moved only by consonant agent)
  )

  ;; Vowel-agent actions (owns blocks with predicate (vowel ?b))
  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ;; Consonant-agent actions (owns blocks with predicate (consonant ?b))
  (:action cons-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action cons-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action cons-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)