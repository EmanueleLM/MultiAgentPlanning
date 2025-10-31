(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (block ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (on ?x - block ?y - block)       ; x is on block y
    (ontable ?x - block)             ; x is on the table
    (clear ?x - block)               ; nothing on x (x is top of its stack)
    (final_on ?x - block ?y - block) ; final relation: x should be on y in the goal
    (final_ontable ?x - block)       ; final relation: x should be on the table (base)
    (inplace ?x - block)             ; x has been placed into its final position and will not be moved further
  )

  ;-----------------------------------------------------------------
  ; Consonant agent actions (prefixed with consonant_)
  ; - General move to table (intermediate single-block piles)
  ; - Final move to table for a block whose final location is on the table
  ; - Final placement onto another block (only allowed if placing onto its final support which is already inplace)
  ; - Direct final move from block->block (if source is on another block)
  ;-----------------------------------------------------------------

  (:action consonant_move_block_to_table_general
    :parameters (?c - block ?below - block)
    :precondition (and
      (consonant ?c)
      (clear ?c)
      (on ?c ?below)
    )
    :effect (and
      (not (on ?c ?below))
      (ontable ?c)
      (clear ?below)
    )
  )

  (:action consonant_move_block_to_table_final
    :parameters (?c - block ?below - block)
    :precondition (and
      (consonant ?c)
      (clear ?c)
      (on ?c ?below)
      (final_ontable ?c)   ; only allowed when this consonant's final location is on the table
    )
    :effect (and
      (not (on ?c ?below))
      (ontable ?c)
      (clear ?below)
      (inplace ?c)        ; mark as placed in final position (base)
    )
  )

  (:action consonant_move_table_to_block_final
    :parameters (?c - block ?tgt - block)
    :precondition (and
      (consonant ?c)
      (ontable ?c)
      (clear ?c)
      (clear ?tgt)
      (final_on ?c ?tgt)  ; only place onto its intended final support
      (inplace ?tgt)      ; target must already be inplace (stable)
    )
    :effect (and
      (not (ontable ?c))
      (on ?c ?tgt)
      (not (clear ?tgt))
      (inplace ?c)
    )
  )

  (:action consonant_move_block_to_block_final
    :parameters (?c - block ?src - block ?tgt - block)
    :precondition (and
      (consonant ?c)
      (clear ?c)
      (on ?c ?src)
      (clear ?tgt)
      (final_on ?c ?tgt)  ; only place onto its intended final support
      (inplace ?tgt)      ; target must already be inplace (stable)
    )
    :effect (and
      (not (on ?c ?src))
      (on ?c ?tgt)
      (clear ?src)
      (not (clear ?tgt))
      (inplace ?c)
    )
  )

  ;-----------------------------------------------------------------
  ; Vowel agent actions (prefixed with vowel_)
  ; - Move vowel top -> table (allowed anytime when vowel is top)
  ; - Move vowel from table -> onto its final consonant support (requires target inplace & clear)
  ; - Move vowel from block -> onto its final consonant support (requires target inplace & clear)
  ; Vowels are constrained: they will only place onto their final target, and only when the target is stable/inplace.
  ;-----------------------------------------------------------------

  (:action vowel_move_block_to_table
    :parameters (?v - block ?src - block)
    :precondition (and
      (vowel ?v)
      (clear ?v)
      (on ?v ?src)
    )
    :effect (and
      (not (on ?v ?src))
      (ontable ?v)
      (clear ?src)
    )
  )

  (:action vowel_move_table_to_block_final
    :parameters (?v - block ?tgt - block)
    :precondition (and
      (vowel ?v)
      (ontable ?v)
      (clear ?v)
      (clear ?tgt)
      (final_on ?v ?tgt)  ; vowel only moves onto its final support
      (inplace ?tgt)      ; and only when the target consonant/block is stable/inplace
    )
    :effect (and
      (not (ontable ?v))
      (on ?v ?tgt)
      (not (clear ?tgt))
      (inplace ?v)
    )
  )

  (:action vowel_move_block_to_block_final
    :parameters (?v - block ?src - block ?tgt - block)
    :precondition (and
      (vowel ?v)
      (clear ?v)
      (on ?v ?src)
      (clear ?tgt)
      (final_on ?v ?tgt)
      (inplace ?tgt)
    )
    :effect (and
      (not (on ?v ?src))
      (on ?v ?tgt)
      (clear ?src)
      (not (clear ?tgt))
      (inplace ?v)
    )
  )

)