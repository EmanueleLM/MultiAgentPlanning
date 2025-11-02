(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block slot)

  (:predicates
    ; block-to-block relation
    (on ?x - block ?y - block)
    ; block-on-table-slot relation
    (on-slot ?x - block ?s - slot)
    ; a block has nothing on top
    (clear ?x - block)
    ; a table slot is free (no block assigned)
    (free ?s - slot)
    ; label predicates for agent capability constraints
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;========================
  ; Vowel agent actions
  ; (can only move vowel-labeled blocks)
  ;========================

  (:action vowel-move-block-to-block
    :parameters (?x - block ?z - block ?y - block)
    :precondition (and (vowel ?x) (on ?x ?z) (clear ?x) (clear ?y))
    :effect (and
      (not (on ?x ?z))
      (on ?x ?y)
      (clear ?z)
      (not (clear ?y))
    )
  )

  (:action vowel-move-block-to-slot
    :parameters (?x - block ?z - block ?s - slot)
    :precondition (and (vowel ?x) (on ?x ?z) (clear ?x) (free ?s))
    :effect (and
      (not (on ?x ?z))
      (on-slot ?x ?s)
      (clear ?z)
      (not (free ?s))
    )
  )

  (:action vowel-move-slot-to-block
    :parameters (?x - block ?s - slot ?y - block)
    :precondition (and (vowel ?x) (on-slot ?x ?s) (clear ?x) (clear ?y))
    :effect (and
      (not (on-slot ?x ?s))
      (on ?x ?y)
      (free ?s)
      (not (clear ?y))
    )
  )

  ;========================
  ; Consonant agent actions
  ; (can only move consonant-labeled blocks)
  ;========================

  (:action consonant-move-block-to-block
    :parameters (?x - block ?z - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?z) (clear ?x) (clear ?y))
    :effect (and
      (not (on ?x ?z))
      (on ?x ?y)
      (clear ?z)
      (not (clear ?y))
    )
  )

  (:action consonant-move-block-to-slot
    :parameters (?x - block ?z - block ?s - slot)
    :precondition (and (consonant ?x) (on ?x ?z) (clear ?x) (free ?s))
    :effect (and
      (not (on ?x ?z))
      (on-slot ?x ?s)
      (clear ?z)
      (not (free ?s))
    )
  )

  (:action consonant-move-slot-to-block
    :parameters (?x - block ?s - slot ?y - block)
    :precondition (and (consonant ?x) (on-slot ?x ?s) (clear ?x) (clear ?y))
    :effect (and
      (not (on-slot ?x ?s))
      (on ?x ?y)
      (free ?s)
      (not (clear ?y))
    )
  )
)