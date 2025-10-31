(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    ;; type classification
    (vowel ?b - block)
    (cons ?b - block)

    ;; spatial relations
    (ontable ?b - block)
    (on ?b - block ?b2 - block)
    (clear ?b - block)

    ;; agent hand state and holdings (separate for each manipulator)
    (handempty-vowel)
    (holding-vowel ?b - block)
    (handempty-cons)
    (holding-cons ?b - block)
  )

  ;; Vowel-agent actions: can only move vowel-labelled blocks (A, E, I).
  ;; They may pick a vowel from the table or from on top of another block,
  ;; they may stack a held vowel onto any clear block, or put it down on the table.
  (:action vowel-pickup-from-table
    :parameters (?x - block)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?x)
      (handempty-vowel)
      ;; prevent simultaneous conflicting holding of same block by consonant hand
      (not (holding-cons ?x))
    )
    :effect (and
      (holding-vowel ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-vowel))
    )
  )

  (:action vowel-pickup-from-block
    :parameters (?x - block ?y - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty-vowel)
      (not (holding-cons ?x))
    )
    :effect (and
      (holding-vowel ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty-vowel))
    )
  )

  (:action vowel-stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (vowel ?x)
      (holding-vowel ?x)
      (clear ?y)
      (not (holding-cons ?x))
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
      (not (clear ?y))
    )
  )

  (:action vowel-putdown
    :parameters (?x - block)
    :precondition (and
      (vowel ?x)
      (holding-vowel ?x)
      (not (holding-cons ?x))
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
    )
  )

  ;; Consonant-agent actions: can only move consonant-labelled blocks (B,C,D,F,G,H,J).
  ;; Analogous action set for consonant manipulator.
  (:action cons-pickup-from-table
    :parameters (?x - block)
    :precondition (and
      (cons ?x)
      (ontable ?x)
      (clear ?x)
      (handempty-cons)
      (not (holding-vowel ?x))
    )
    :effect (and
      (holding-cons ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-cons))
    )
  )

  (:action cons-pickup-from-block
    :parameters (?x - block ?y - block)
    :precondition (and
      (cons ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty-cons)
      (not (holding-vowel ?x))
    )
    :effect (and
      (holding-cons ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty-cons))
    )
  )

  (:action cons-stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (cons ?x)
      (holding-cons ?x)
      (clear ?y)
      (not (holding-vowel ?x))
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty-cons)
      (not (holding-cons ?x))
      (not (clear ?y))
    )
  )

  (:action cons-putdown
    :parameters (?x - block)
    :precondition (and
      (cons ?x)
      (holding-cons ?x)
      (not (holding-vowel ?x))
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-cons)
      (not (holding-cons ?x))
    )
  )
)