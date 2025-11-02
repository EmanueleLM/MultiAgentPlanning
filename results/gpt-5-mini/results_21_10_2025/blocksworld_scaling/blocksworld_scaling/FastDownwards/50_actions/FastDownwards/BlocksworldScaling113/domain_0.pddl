(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?u - block)        ; block ?b is directly on block ?u
    (ontable ?b - block)              ; block ?b is directly on the table
    (clear ?b - block)                ; block ?b is top of its stack (nothing on it)
    (vowel ?b - block)                ; block is a vowel (A,E,I,O,U)
    (consonant ?b - block)            ; block is a consonant
    (vowel-agent ?a - agent)          ; agent is the vowel agent
    (consonant-agent ?a - agent)      ; agent is the consonant agent
  )

  ; ---------------------------
  ; Vowel agent actions (can only move vowel blocks)
  ; ---------------------------

  ; move vowel block from on-top-of-block to on-top-of-block
  (:action vowel-move-on-to-on
    :parameters (?ag - agent ?b - block ?u - block ?dest - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?b)
      (on ?b ?u)
      (clear ?b)
      (clear ?dest)
    )
    :effect (and
      (not (on ?b ?u))
      (on ?b ?dest)
      (not (clear ?dest))
      (clear ?u)
      (clear ?b)
    )
  )

  ; move vowel block from on-top-of-block to table
  (:action vowel-move-on-to-table
    :parameters (?ag - agent ?b - block ?u - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?b)
      (on ?b ?u)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?u))
      (ontable ?b)
      (clear ?u)
      (clear ?b)
    )
  )

  ; move vowel block from table to on-top-of-block
  (:action vowel-move-table-to-on
    :parameters (?ag - agent ?b - block ?dest - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?dest)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (not (clear ?dest))
      (clear ?b)
    )
  )

  ; ---------------------------
  ; Consonant agent actions (can only move consonant blocks)
  ; ---------------------------

  ; move consonant block from on-top-of-block to on-top-of-block
  (:action consonant-move-on-to-on
    :parameters (?ag - agent ?b - block ?u - block ?dest - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (on ?b ?u)
      (clear ?b)
      (clear ?dest)
    )
    :effect (and
      (not (on ?b ?u))
      (on ?b ?dest)
      (not (clear ?dest))
      (clear ?u)
      (clear ?b)
    )
  )

  ; move consonant block from on-top-of-block to table
  (:action consonant-move-on-to-table
    :parameters (?ag - agent ?b - block ?u - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (on ?b ?u)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?u))
      (ontable ?b)
      (clear ?u)
      (clear ?b)
    )
  )

  ; move consonant block from table to on-top-of-block
  (:action consonant-move-table-to-on
    :parameters (?ag - agent ?b - block ?dest - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?dest)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (not (clear ?dest))
      (clear ?b)
    )
  )
)