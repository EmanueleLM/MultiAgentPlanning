(define (domain blocks-vowel-consonant)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel consonant - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
  )

  ;; Vowel agent actions (can only move vowel blocks a, e, i)
  (:action vowel-move-block-to-table
    :parameters (?x - vowel ?from - block)
    :precondition (and (clear ?x) (on ?x ?from))
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
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