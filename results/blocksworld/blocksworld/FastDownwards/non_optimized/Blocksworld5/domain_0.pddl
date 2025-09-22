(define (domain block-stacking-multiagent)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is on ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing on top of ?x
    (vowel ?x - block)            ; moved by vowel agent
    (consonant ?x - block)        ; moved by consonant agent
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Actions of the Vowel agent (can move only vowel-labeled blocks)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Move a vowel block from one block to another block
  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  ;; Move a vowel block from the table onto another block
  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  ;; Move a vowel block from a block to the table
  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
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

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Actions of the Consonant agent (can move only consonant-labeled blocks)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Move a consonant block from one block to another block
  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (clear ?to)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Move a consonant block from the table onto a block
  (:action consonant-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (clear ?to)
      (ontable ?b)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  ;; Move a consonant block from a block to the table
  (:action consonant-move-block-to-table
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
      (clear ?b)
    )
  )

)