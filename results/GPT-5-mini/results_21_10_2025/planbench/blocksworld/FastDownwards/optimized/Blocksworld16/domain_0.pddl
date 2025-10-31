(define (domain multi-agent-stacking)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is on ?y
    (ontable ?x - block)              ; ?x is on the table
    (clear ?x - block)                ; nothing is on ?x
    (vowel ?x - block)                ; ?x is a vowel block (moved by vowel-agent)
    (consonant ?x - block)            ; ?x is a consonant block (moved by consonant-agent)

    ;; Vowel-agent hand predicates
    (holding-vowel ?x - block)
    (handempty-vowel)

    ;; Consonant-agent hand predicates
    (holding-cons ?x - block)
    (handempty-cons)
  )

  ;; ==================================================
  ;; Actions belonging to the vowel agent (vowel-*)
  ;; Vowel agent can only pick up blocks marked (vowel ?x)
  ;; ==================================================

  ;; Pick up a vowel block from the table
  (:action vowel-pickup-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty-vowel))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty-vowel))
              (holding-vowel ?b)
            )
  )

  ;; Pick up a vowel block that is on another block
  (:action vowel-pickup-from-block
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (on ?b ?under) (clear ?b) (handempty-vowel))
    :effect (and
              (not (on ?b ?under))
              (not (clear ?b))
              (not (handempty-vowel))
              (holding-vowel ?b)
              (clear ?under)
            )
  )

  ;; Put a held vowel block down onto the table
  (:action vowel-putdown-to-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding-vowel ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (not (holding-vowel ?b))
              (handempty-vowel)
            )
  )

  ;; Put a held vowel block down onto another clear block
  (:action vowel-putdown-to-block
    :parameters (?b - block ?target - block)
    :precondition (and (vowel ?b) (holding-vowel ?b) (clear ?target))
    :effect (and
              (on ?b ?target)
              (clear ?b)
              (not (clear ?target))
              (not (holding-vowel ?b))
              (handempty-vowel)
            )
  )

  ;; ==================================================
  ;; Actions belonging to the consonant agent (cons-*)
  ;; Consonant agent can only pick up blocks marked (consonant ?x)
  ;; ==================================================

  ;; Pick up a consonant block from the table
  (:action cons-pickup-from-table
    :parameters (?x - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?x) (handempty-cons))
    :effect (and
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty-cons))
              (holding-cons ?x)
            )
  )

  ;; Unstack a consonant block from another block
  (:action cons-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?y) (clear ?x) (handempty-cons))
    :effect (and
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty-cons))
              (holding-cons ?x)
              (clear ?y)
            )
  )

  ;; Stack a held consonant block onto another block
  (:action cons-stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding-cons ?x) (clear ?y))
    :effect (and
              (not (holding-cons ?x))
              (not (clear ?y))
              (on ?x ?y)
              (clear ?x)
              (handempty-cons)
            )
  )

  ;; Put down a held consonant block onto the table
  (:action cons-putdown-to-table
    :parameters (?x - block)
    :precondition (and (holding-cons ?x))
    :effect (and
              (not (holding-cons ?x))
              (ontable ?x)
              (clear ?x)
              (handempty-cons)
            )
  )
)