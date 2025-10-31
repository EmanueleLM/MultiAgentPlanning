(define (domain multiagent_blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is on block ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing on top of ?x
    (vowel ?x - block)            ; block is a vowel (moved by vowel agent)
    (consonant ?x - block)        ; block is a consonant (moved by consonant agent)
  )

  ;; Vowel-agent actions (kept distinct and labeled)
  (:action vowel-move-from-block-to-block
    :parameters (?v - block ?from - block ?to - block)
    :precondition (and
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
      (clear ?to)
    )
    :effect (and
      (not (on ?v ?from))
      (on ?v ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?v)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?v - block ?to - block)
    :precondition (and
      (vowel ?v)
      (ontable ?v)
      (clear ?v)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?v))
      (on ?v ?to)
      (not (clear ?to))
      (clear ?v)
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?v - block ?from - block)
    :precondition (and
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
    )
    :effect (and
      (not (on ?v ?from))
      (ontable ?v)
      (clear ?from)
      (clear ?v)
    )
  )

  ;; Consonant-agent actions (kept distinct and labeled)
  (:action consonant-move-from-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (clear ?x)
    )
  )
)