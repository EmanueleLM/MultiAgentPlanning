(define (domain BlocksworldScaling16)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    ;; block-on-block and block-on-table relations
    (on ?b - block ?under - block)
    (ontable ?b - block)

    ;; a block is clear iff there is no block on top of it
    (clear ?b - block)

    ;; agent capability annotations
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Consonant-agent actions (can only move consonant blocks)
  (:action consonant_agent-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (consonant ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      ;; source becomes clear after removing ?b
      (clear ?from)
      ;; destination loses clear because ?b is placed on it
      (not (clear ?to))
      ;; ?b remains clear (it has no block on top)
    )
  )

  (:action consonant_agent-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (consonant ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      ;; ?b remains clear
    )
  )

  (:action consonant_agent-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (consonant ?b)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      ;; ?b remains clear
    )
  )

  ;; Vowel-agent actions (can only move vowel blocks)
  (:action vowel_agent-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (vowel ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel_agent-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action vowel_agent-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (vowel ?b)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )
)