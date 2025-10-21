(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    (on ?x - block ?y - block)    ; x is on block y
    (ontable ?x - block)          ; x is directly on the table
    (clear ?x - block)            ; nothing on x (x is the top of its stack)
  )

  ;-------------------------
  ; Vowel agent moves (A, E, I)
  ; - move a vowel from a block to the table
  ; - move a vowel from the table onto a clear block
  ; - move a vowel from a block onto a clear block
  ; All moves require the moved block to be clear (top of its stack).
  ;-------------------------
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
      (clear ?v)
    )
  )

  (:action vowel_move_table_to_block
    :parameters (?v - block ?tgt - block)
    :precondition (and
      (vowel ?v)
      (ontable ?v)
      (clear ?v)
      (clear ?tgt)
    )
    :effect (and
      (not (ontable ?v))
      (on ?v ?tgt)
      (not (clear ?tgt))
      (clear ?v)
    )
  )

  (:action vowel_move_block_to_block
    :parameters (?v - block ?src - block ?tgt - block)
    :precondition (and
      (vowel ?v)
      (clear ?v)
      (on ?v ?src)
      (clear ?tgt)
    )
    :effect (and
      (not (on ?v ?src))
      (on ?v ?tgt)
      (clear ?src)
      (not (clear ?tgt))
      (clear ?v)
    )
  )

  ;-------------------------
  ; Consonant agent moves (all other letters)
  ; - symmetric set of moves for consonants
  ;-------------------------
  (:action consonant_move_block_to_table
    :parameters (?c - block ?src - block)
    :precondition (and
      (consonant ?c)
      (clear ?c)
      (on ?c ?src)
    )
    :effect (and
      (not (on ?c ?src))
      (ontable ?c)
      (clear ?src)
      (clear ?c)
    )
  )

  (:action consonant_move_table_to_block
    :parameters (?c - block ?tgt - block)
    :precondition (and
      (consonant ?c)
      (ontable ?c)
      (clear ?c)
      (clear ?tgt)
    )
    :effect (and
      (not (ontable ?c))
      (on ?c ?tgt)
      (not (clear ?tgt))
      (clear ?c)
    )
  )

  (:action consonant_move_block_to_block
    :parameters (?c - block ?src - block ?tgt - block)
    :precondition (and
      (consonant ?c)
      (clear ?c)
      (on ?c ?src)
      (clear ?tgt)
    )
    :effect (and
      (not (on ?c ?src))
      (on ?c ?tgt)
      (clear ?src)
      (not (clear ?tgt))
      (clear ?c)
    )
  )
)