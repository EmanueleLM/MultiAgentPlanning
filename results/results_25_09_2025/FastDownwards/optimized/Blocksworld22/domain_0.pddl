(define (domain multiagent-blocks)
  (:requirements :strips)
  (:predicates
    (on ?b ?x)        ; block ?b is on block ?x
    (ontable ?b)      ; block ?b is on the table
    (clear ?b)        ; nothing on top of block ?b
    (vowel ?b)        ; block ?b is a vowel block (movable by vowel-agent)
    (consonant ?b)    ; block ?b is a consonant block (movable by consonant-agent)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Vowel-agent actions (kept distinct by name)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Move a vowel block from one block to another block
  (:action vowel-move-block-to-block
    :parameters (?b ?from ?to)
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
    )
  )

  ;; Move a vowel block from the table onto another block
  (:action vowel-move-table-to-block
    :parameters (?b ?to)
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
    )
  )

  ;; Move a vowel block from on top of a block to the table
  (:action vowel-move-block-to-table
    :parameters (?b ?from)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (ontable ?b)
      (not (on ?b ?from))
      (clear ?from)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Consonant-agent actions (kept distinct by name)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Move a consonant block from one block (?from) onto another block (?to).
  (:action consonant-move-block-to-block
    :parameters (?b ?from ?to)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (clear ?to)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (not (clear ?to))
      (on ?b ?to)
      (clear ?from)
    )
  )

  ;; Move a consonant block from the table onto a block.
  (:action consonant-move-table-to-block
    :parameters (?b ?to)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (clear ?to)
      (ontable ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?to))
      (on ?b ?to)
    )
  )

  ;; Move a consonant block from a block onto the table.
  (:action consonant-move-block-to-table
    :parameters (?b ?from)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)