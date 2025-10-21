(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)      ; block ?x is on block ?y
    (ontable ?x - block)            ; block ?x is on the table
    (clear ?x - block)              ; nothing on top of ?x
    (vowel ?x - block)              ; block ?x can be moved by the vowel agent
    (consonant ?x - block)          ; block ?x can be moved by the consonant agent
  )

  ;; Vowel-agent actions (can only move blocks marked (vowel ?x))
  (:action vowel-move-from-table-to-block
    :parameters (?x - block ?y - block)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?y)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?y)
      (not (clear ?y))
    )
  )

  (:action vowel-move-block-to-block
    :parameters (?x - block ?z - block ?y - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?z)
      (clear ?x)
      (clear ?y)
    )
    :effect (and
      (not (on ?x ?z))
      (on ?x ?y)
      (clear ?z)
      (not (clear ?y))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?x - block ?z - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?z)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?z))
      (ontable ?x)
      (clear ?z)
    )
  )

  ;; Consonant-agent actions (can only move blocks marked (consonant ?x))
  (:action cons-move-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and
      (consonant ?x)
      (clear ?x)
      (ontable ?x)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  (:action cons-move-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (consonant ?x)
      (clear ?x)
      (on ?x ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action cons-move-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (consonant ?x)
      (clear ?x)
      (on ?x ?from)
    )
    :effect (and
      (ontable ?x)
      (clear ?from)
      (not (on ?x ?from))
    )
  )
)