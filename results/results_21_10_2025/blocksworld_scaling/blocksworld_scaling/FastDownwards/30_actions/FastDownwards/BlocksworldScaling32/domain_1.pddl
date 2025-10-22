(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)      ; ?x is directly on block ?y
    (on-table ?x - block)           ; ?x is directly on the table
    (clear ?x - block)              ; nothing on top of ?x (it is a top)
    (vowel ?x - block)              ; ?x is a vowel (movable by vowel agent)
    (consonant ?x - block)          ; ?x is a consonant (movable by consonant agent)
  )

  ;; ============================
  ;; Vowel-agent actions (A, E, I)
  ;; ============================

  ;; Move a vowel from being on another block to the table
  (:action vowel-move-from-block-to-table
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (on ?x ?y) (clear ?x))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (clear ?y)
      (not (on ?x ?y))
    )
  )

  ;; Move a vowel from the table onto a target top block
  (:action vowel-move-from-table-onto
    :parameters (?x - block ?z - block)
    :precondition (and (vowel ?x) (on-table ?x) (clear ?x) (clear ?z))
    :effect (and
      (on ?x ?z)
      (not (on-table ?x))
      (not (clear ?z))
      (clear ?x)
    )
  )

  ;; Move a vowel from being on a block Y onto a different top block Z
  (:action vowel-move-from-block-onto
    :parameters (?x - block ?y - block ?z - block)
    :precondition (and (vowel ?x) (on ?x ?y) (clear ?x) (clear ?z))
    :effect (and
      (on ?x ?z)
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?z))
      (clear ?x)
    )
  )

  ;; =================================
  ;; Consonant-agent actions (all others)
  ;; =================================

  ;; Move a consonant from being on another block to the table
  (:action consonant-move-from-block-to-table
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?y) (clear ?x))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (clear ?y)
      (not (on ?x ?y))
    )
  )

  ;; Move a consonant from the table onto a target top block
  (:action consonant-move-from-table-onto
    :parameters (?x - block ?z - block)
    :precondition (and (consonant ?x) (on-table ?x) (clear ?x) (clear ?z))
    :effect (and
      (on ?x ?z)
      (not (on-table ?x))
      (not (clear ?z))
      (clear ?x)
    )
  )

  ;; Move a consonant from being on a block Y onto a different top block Z
  (:action consonant-move-from-block-onto
    :parameters (?x - block ?y - block ?z - block)
    :precondition (and (consonant ?x) (on ?x ?y) (clear ?x) (clear ?z))
    :effect (and
      (on ?x ?z)
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?z))
      (clear ?x)
    )
  )
)