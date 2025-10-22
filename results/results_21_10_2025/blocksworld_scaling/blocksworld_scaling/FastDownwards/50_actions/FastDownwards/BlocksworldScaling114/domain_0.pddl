(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is on ?y
    (ontable ?x - block)             ; ?x is directly on the table
    (clear ?x - block)               ; ?x has no block on top (is top-of-stack)
    (vowel ?x - block)               ; ?x is a vowel block (movable only by vowel agent)
    (consonant ?x - block)           ; ?x is a consonant block (movable only by consonant agent)
  )

  ;========================
  ; Vowel-agent actions
  ;========================

  ; Move a vowel block from on top of another block to the table
  (:action vowel_move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (ontable ?b)
      (clear ?from)
      (not (on ?b ?from))
    )
  )

  ; Move a vowel block that is on another block onto another destination block
  (:action vowel_move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (on ?b ?to)
      (clear ?from)
      (not (on ?b ?from))
      (not (clear ?to))
    )
  )

  ; Move a vowel block from the table onto another block
  (:action vowel_move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (on ?b ?to)
      (not (ontable ?b))
      (not (clear ?to))
    )
  )

  ;========================
  ; Consonant-agent actions
  ;========================

  ; Move a consonant block from on top of another block to the table
  (:action consonant_move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (ontable ?b)
      (clear ?from)
      (not (on ?b ?from))
    )
  )

  ; Move a consonant block that is on another block onto another destination block
  (:action consonant_move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (on ?b ?to)
      (clear ?from)
      (not (on ?b ?from))
      (not (clear ?to))
    )
  )

  ; Move a consonant block from the table onto another block
  (:action consonant_move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (on ?b ?to)
      (not (ontable ?b))
      (not (clear ?to))
    )
  )
)