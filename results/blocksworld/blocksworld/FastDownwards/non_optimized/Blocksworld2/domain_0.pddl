(define (domain orchestrated-blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is directly on ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing on ?x
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Agent1 (from vowel-agent-blocks) actions - keep distinct names
  (:action agent1-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (vowel ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action agent1-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (vowel ?b)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action agent1-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ;; Agent2 (from blocks-vowels-consonants) actions - keep distinct names
  ;; Consonant moves (agent2)
  (:action agent2-move-consonant-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action agent2-move-consonant-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
  )

  (:action agent2-move-consonant-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  ;; Vowel moves (agent2) - distinct from agent1's actions
  (:action agent2-move-vowel-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action agent2-move-vowel-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
  )

  (:action agent2-move-vowel-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
    )
  )
)