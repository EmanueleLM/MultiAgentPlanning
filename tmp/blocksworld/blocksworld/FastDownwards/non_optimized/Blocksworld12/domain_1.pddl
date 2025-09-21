(define (domain multi_agent_blocks)
  (:requirements :strips)
  (:predicates
    (on ?b ?x)
    (ontable ?b)
    (clear ?b)
    (block ?b)
    (vowel ?b)
    (consonant ?b)
  )

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
            )
  )

  (:action agent1_move-vowel-table-to-block
    :parameters (?b ?to)
    :precondition (and
                    (vowel ?b)
                    (ontable ?b)
                    (clear ?b)
                    (block ?to)
                    (clear ?to)
                   )
    :effect (and
              (not (ontable ?b))
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
              (clear ?from)
            )
  )

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
             (clear ?from)
            )
  )

  (:action agent2_move-consonant-table-to-block
    :parameters (?x ?to)
    :precondition (and
                    (consonant ?x)
                    (ontable ?x)
                    (clear ?x)
                    (block ?to)
                    (clear ?to)
                   )
    :effect (and
             (not (ontable ?x))
             (on ?x ?to)
             (not (clear ?to))
            )
  )

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
             (clear ?from)
            )
  )

  (:action agent2_move-vowel-table-to-block
    :parameters (?x ?to)
    :precondition (and
                    (vowel ?x)
                    (ontable ?x)
                    (clear ?x)
                    (block ?to)
                    (clear ?to)
                   )
    :effect (and
             (not (ontable ?x))
             (on ?x ?to)
             (not (clear ?to))
            )
  )
)