(define (domain multiagent_blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    ; relation: block X is directly on block Y
    (on ?x - block ?y - block)
    ; relation: block X is on the table
    (ontable ?x - block)
    ; block has nothing on top (is top of its stack)
    (clear ?x - block)
    ; classification of blocks by agent permission
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;-------------------------
  ; VOWEL_AGENT actions (only moves A, E, I)
  ; Names prefixed with vowel_ to keep actions distinct
  ;-------------------------

  ; move from block to block (vowel agent)
  (:action vowel_move_b2b
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      ; ?b remains clear after the move (it was clear and remains top)
    )
  )

  ; move from table to block (vowel agent)
  (:action vowel_move_t2b
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      ; ?b remains clear
    )
  )

  ; move from block to table (vowel agent)
  (:action vowel_move_b2t
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ;-------------------------
  ; CONSONANT_AGENT actions (only moves B,C,D,F,G,H,J,K,L)
  ; Names prefixed with consonant_ to keep actions distinct
  ;-------------------------

  ; move from block to block (consonant agent)
  (:action consonant_move_b2b
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ; move from table to block (consonant agent)
  (:action consonant_move_t2b
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ; move from block to table (consonant agent)
  (:action consonant_move_b2t
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
    )
  )
)