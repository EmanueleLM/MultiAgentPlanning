(define (domain multi_agent_blocks)
  (:requirements :strips)
  (:predicates
    (on ?b ?x)        ; ?b is on ?x (x can be a block or the table symbol)
    (ontable ?b)      ; ?b is on the table (table is represented as the object "table")
    (clear ?b)        ; ?b has nothing on top
    (block ?b)        ; identifies blocks (table is not declared a block)
    (vowel ?b)        ; block is a vowel block
    (consonant ?b)    ; block is a consonant block
  )

  ;; ----- Agent 1 (vowel-only) actions -----
  (:action agent1_move-vowel-block-to-block
    :parameters (?b ?from ?to)
    :precondition (and
                    (vowel ?b)
                    (on ?b ?from)
                    (block ?from)
                    (block ?to)
                    (clear ?b)
                    (clear ?to)
                   )
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
              ;; if it was on the table representation, ensure it's removed
              (not (ontable ?b))
              (not (on ?b table))
            )
  )

  (:action agent1_move-vowel-table-to-block
    :parameters (?b ?to)
    :precondition (and
                    (vowel ?b)
                    (ontable ?b)
                    (on ?b table)
                    (clear ?b)
                    (block ?to)
                    (clear ?to)
                   )
    :effect (and
              (not (ontable ?b))
              (not (on ?b table))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action agent1_move-vowel-block-to-table
    :parameters (?b ?from)
    :precondition (and
                    (vowel ?b)
                    (on ?b ?from)
                    (block ?from)
                    (clear ?b)
                   )
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (on ?b table)
              (clear ?from)
            )
  )

  ;; ----- Agent 2 (consonant and vowel actions) -----
  (:action agent2_move-consonant-block-to-block
    :parameters (?x ?from ?to)
    :precondition (and
                    (consonant ?x)
                    (on ?x ?from)
                    (block ?from)
                    (block ?to)
                    (clear ?x)
                    (clear ?to)
                   )
    :effect (and
             (not (on ?x ?from))
             (on ?x ?to)
             (clear ?from)
             (not (clear ?to))
             (not (ontable ?x))
             (not (on ?x table))
            )
  )

  (:action agent2_move-consonant-block-to-table
    :parameters (?x ?from)
    :precondition (and
                    (consonant ?x)
                    (on ?x ?from)
                    (block ?from)
                    (clear ?x)
                   )
    :effect (and
             (not (on ?x ?from))
             (ontable ?x)
             (on ?x table)
             (clear ?from)
            )
  )

  (:action agent2_move-consonant-table-to-block
    :parameters (?x ?to)
    :precondition (and
                    (consonant ?x)
                    (ontable ?x)
                    (on ?x table)
                    (clear ?x)
                    (block ?to)
                    (clear ?to)
                   )
    :effect (and
             (not (ontable ?x))
             (not (on ?x table))
             (on ?x ?to)
             (not (clear ?to))
            )
  )

  ;; Agent 2 also provides vowel-moving actions (kept distinct)
  (:action agent2_move-vowel-block-to-block
    :parameters (?x ?from ?to)
    :precondition (and
                    (vowel ?x)
                    (on ?x ?from)
                    (block ?from)
                    (block ?to)
                    (clear ?x)
                    (clear ?to)
                   )
    :effect (and
             (not (on ?x ?from))
             (on ?x ?to)
             (clear ?from)
             (not (clear ?to))
             (not (ontable ?x))
             (not (on ?x table))
            )
  )

  (:action agent2_move-vowel-block-to-table
    :parameters (?x ?from)
    :precondition (and
                    (vowel ?x)
                    (on ?x ?from)
                    (block ?from)
                    (clear ?x)
                   )
    :effect (and
             (not (on ?x ?from))
             (ontable ?x)
             (on ?x table)
             (clear ?from)
            )
  )

  (:action agent2_move-vowel-table-to-block
    :parameters (?x ?to)
    :precondition (and
                    (vowel ?x)
                    (ontable ?x)
                    (on ?x table)
                    (clear ?x)
                    (block ?to)
                    (clear ?to)
                   )
    :effect (and
             (not (ontable ?x))
             (not (on ?x table))
             (on ?x ?to)
             (not (clear ?to))
            )
  )
)