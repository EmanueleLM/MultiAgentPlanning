(define (domain multiagent_blocks)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (on ?x ?y)         ; ?x is on ?y (y can be another block or the table)
    (clear ?x)         ; nothing on top of ?x (we allow this for any object, including table)
    (vowel ?x)         ; block is movable by vowel agent
    (consonant ?x)     ; block is movable by consonant agent
  )

  ;; --------------------
  ;; Vowel-agent actions
  ;; --------------------

  ;; Move a vowel block from a block (not the table) onto another block
  (:action vowel_move_block_to_block
    :parameters (?b ?from ?to)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (on ?b table))   ; ensure from is not the table (handled by separate action)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a vowel block that is on the table onto a block
  (:action vowel_move_table_to_block
    :parameters (?b ?to)
    :precondition (and
      (vowel ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Move a vowel block from a block onto the table
  (:action vowel_move_block_to_table
    :parameters (?b ?from)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (not (on ?b table))   ; ensure it's currently not already on the table
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )

  ;; ------------------------
  ;; Consonant-agent actions
  ;; ------------------------

  ;; Move a consonant block from a block (not the table) onto another block
  (:action consonant_move_block_to_block
    :parameters (?b ?from ?to)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (on ?b table))   ; ensure from is not the table
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a consonant block that is on the table onto a block
  (:action consonant_move_table_to_block
    :parameters (?b ?to)
    :precondition (and
      (consonant ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Move a consonant block from a block onto the table
  (:action consonant_move_block_to_table
    :parameters (?b ?from)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (not (on ?b table))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )
)