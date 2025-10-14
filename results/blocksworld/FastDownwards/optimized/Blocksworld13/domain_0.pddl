(define (domain multi-agent-blocks)
  (:requirements :strips :negative-preconditions :equality)
  (:predicates
    (on ?x ?y)        ; ?x is on ?y (y is a block)
    (ontable ?x)      ; ?x is on the table
    (clear ?x)        ; nothing on top of ?x
    (vowel ?x)        ; block is vowel-controlled (vowel_agent)
    (consonant ?x)    ; block is consonant-controlled (consonant_agent)
  )

  ;; Vowel agent actions (vowel_agent may move only vowel-labeled blocks:
  ;; A E I O U). Three atomic move actions cover all direct moves:
  ;; - from-block to-block
  ;; - from-table to-block
  ;; - from-block to-table
  ;; Agent can move only top (clear) blocks; destination block must be clear.
  (:action vowel_move_block_to_block
    :parameters (?b ?from ?to)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to) (not (= ?b ?to)))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel_move_table_to_block
    :parameters (?b ?to)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to) (not (= ?b ?to)))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel_move_block_to_table
    :parameters (?b ?from)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (not (= ?b ?from)))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ;; Consonant agent actions (consonant_agent may move only consonant-labeled blocks:
  ;; J G K F C H D B). Same atomic moves, distinct action names to keep agents separate.
  (:action consonant_move_block_to_block
    :parameters (?b ?from ?to)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to) (not (= ?b ?to)))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant_move_table_to_block
    :parameters (?b ?to)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to) (not (= ?b ?to)))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant_move_block_to_table
    :parameters (?b ?from)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (not (= ?b ?from)))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)