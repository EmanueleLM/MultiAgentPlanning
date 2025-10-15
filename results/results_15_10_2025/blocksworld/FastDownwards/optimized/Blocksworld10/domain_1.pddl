(define (domain multiagent-blocksworld)
  :requirements :typing :negative-preconditions
  :types block agent
  :predicates
    (on ?x ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)

  ;; Vowel-agent atomic moves (vowel_agent may only move blocks A E I O)
  (:action vowel-move-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and (vowel ?x) (on ?x ?from) (clear ?x) (clear ?to))
    :effect (and
              (not (on ?x ?from))
              (on ?x ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action vowel-move-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and (vowel ?x) (ontable ?x) (clear ?x) (clear ?to))
    :effect (and
              (not (ontable ?x))
              (on ?x ?to)
              (not (clear ?to))
            )
  )

  (:action vowel-move-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and (vowel ?x) (on ?x ?from) (clear ?x))
    :effect (and
              (not (on ?x ?from))
              (ontable ?x)
              (clear ?from)
            )
  )

  ;; Consonant-agent atomic moves (consonant_agent may only move B C D F G H J K L M N)
  (:action consonant-move-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and (consonant ?x) (on ?x ?from) (clear ?x) (clear ?to))
    :effect (and
              (not (on ?x ?from))
              (on ?x ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action consonant-move-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?x) (clear ?to))
    :effect (and
              (not (ontable ?x))
              (on ?x ?to)
              (not (clear ?to))
            )
  )

  (:action consonant-move-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and (consonant ?x) (on ?x ?from) (clear ?x))
    :effect (and
              (not (on ?x ?from))
              (ontable ?x)
              (clear ?from)
            )
  )
)