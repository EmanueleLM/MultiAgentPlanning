(define (domain multiagent-vowel-consonant)
  (:requirements :strips :typing :equality :negative-preconditions)
  (:types block vowel consonant)
  (:predicates
    ;; agent capability marker (keeps vowel-only constraint explicit)
    (vowel ?b - block)

    ;; world fluents
    (on ?b - block ?below - block)
    (ontable ?b - block)
    (clear ?b - block)
  )

  ;; Vowel-agent actions (can only move blocks marked (vowel ...))
  (:action vowel-move-block-to-block
    :parameters (?x - vowel ?from - block ?to - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?x - vowel ?from - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?x - vowel ?to - block)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  ;; Consonant-agent actions (can only move objects of type consonant)
  (:action cons-move-from-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action cons-move-from-table-to-block
    :parameters (?b - consonant ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action cons-move-from-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)