(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is on top of ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing on top of ?x
  )

  ;; Vowel-agent actions (vowel_agent moves only vowel blocks)
  ;; Move a vowel block from the table onto another block
  (:action vowel_agent-move-from-table-to-block
    :parameters (?b - vowel ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (not (clear ?to))
              (on ?b ?to)
              (clear ?b)
            )
  )

  ;; Move a vowel block from one block onto another block
  (:action vowel_agent-move-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (not (clear ?to))
              (on ?b ?to)
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Move a vowel block from a block onto the table
  (:action vowel_agent-move-from-block-to-table
    :parameters (?b - vowel ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Consonant-agent actions (consonant_agent moves only consonant blocks)
  ;; Move a consonant block from the table onto another block
  (:action consonant_agent-move-from-table-to-block
    :parameters (?b - consonant ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (not (clear ?to))
              (on ?b ?to)
              (clear ?b)
            )
  )

  ;; Move a consonant block from one block onto another block
  (:action consonant_agent-move-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (not (clear ?to))
              (on ?b ?to)
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Move a consonant block from a block onto the table
  (:action consonant_agent-move-from-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
              (clear ?b)
            )
  )

)