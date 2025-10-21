(define (domain blocks-vowel-consonant)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)

  (:predicates
    (on ?x - block ?y - block)    ; x is immediately on y
    (ontable ?x - block)          ; x is directly on the table
    (clear ?x - block)            ; nothing on x (x is top of its stack)
  )

  ;; Vowel agent actions (can only move vowel blocks A, E, I)
  (:action vowel-move-block-to-table
    :parameters (?x - vowel ?from - block)
    :precondition (and (clear ?x) (on ?x ?from))
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (not (clear ?x))
      ;; after moving to table, ?x is top on its own table position
      (clear ?x)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?x - vowel ?dest - block)
    :precondition (and (clear ?x) (ontable ?x) (clear ?dest))
    :effect (and
      (not (ontable ?x))
      (on ?x ?dest)
      (not (clear ?dest))
      (clear ?x)
    )
  )

  (:action vowel-move-block-to-block
    :parameters (?x - vowel ?from - block ?dest - block)
    :precondition (and (clear ?x) (on ?x ?from) (clear ?dest))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?dest)
      (clear ?from)
      (not (clear ?dest))
      (clear ?x)
    )
  )

  ;; Consonant agent actions (can only move consonant blocks)
  (:action consonant-move-block-to-table
    :parameters (?x - consonant ?from - block)
    :precondition (and (clear ?x) (on ?x ?from))
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (clear ?x)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?x - consonant ?dest - block)
    :precondition (and (clear ?x) (ontable ?x) (clear ?dest))
    :effect (and
      (not (ontable ?x))
      (on ?x ?dest)
      (not (clear ?dest))
      (clear ?x)
    )
  )

  (:action consonant-move-block-to-block
    :parameters (?x - consonant ?from - block ?dest - block)
    :precondition (and (clear ?x) (on ?x ?from) (clear ?dest))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?dest)
      (clear ?from)
      (not (clear ?dest))
      (clear ?x)
    )
  )
)