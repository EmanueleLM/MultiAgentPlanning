(define (domain integrated-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)    ; ?x is on ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing on ?x
    (vowel ?x - block)            ; block is a vowel (moved by vowel agent)
    (consonant ?x - block)        ; block is a consonant (moved by consonant agent)
  )

  ;; Vowel-agent actions (distinct namespace)
  (:action vowel-move-from-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?to)
      (not (on ?x ?to))
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?to))
      (on ?x ?to)
      (clear ?x)
    )
  )

  (:action vowel-move-from-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (not (on ?x ?to))
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (not (clear ?to))
      (on ?x ?to)
      (clear ?x)
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (ontable ?x)
      (clear ?x)
    )
  )

  ;; Consonant-agent actions (distinct namespace)
  (:action cons-move-from-table-to-block
    :parameters (?b - block ?t - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?t)
      (not (on ?b ?t))
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?t))
      (on ?b ?t)
      (clear ?b)
    )
  )

  (:action cons-move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (on ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (clear ?from)
      (not (clear ?to))
      (on ?b ?to)
      (clear ?b)
    )
  )

  (:action cons-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )
)