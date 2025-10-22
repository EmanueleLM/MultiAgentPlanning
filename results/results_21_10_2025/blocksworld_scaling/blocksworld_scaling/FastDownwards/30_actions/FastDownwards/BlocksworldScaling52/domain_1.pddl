(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table)
  (:predicates
    (on ?b - block ?p - block)    ;; block ?b is directly on block ?p
    (ontable ?b - block)          ;; block ?b is directly on the table
    (clear ?b - block)            ;; nothing is on top of block ?b
    (is-vowel ?b - block)         ;; block can only be moved by vowel agent
    (is-consonant ?b - block)     ;; block can only be moved by consonant agent
  )

  ;; Vowel agent actions (move only A, E, I as marked by is-vowel)
  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (is-vowel ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?to))
      (on ?b ?to)
      (clear ?b)
    )
  )

  (:action vowel-move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (is-vowel ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (is-vowel ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?b)
      (clear ?from)
    )
  )

  ;; Consonant agent actions (move only consonant blocks as marked)
  (:action cons-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (is-consonant ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?to))
      (on ?b ?to)
      (clear ?b)
    )
  )

  (:action cons-move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (is-consonant ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action cons-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (is-consonant ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?b)
      (clear ?from)
    )
  )
)