(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)         ; ?x is on ?y
    (ontable ?x - block)               ; ?x is on the table
    (clear ?x - block)                 ; nothing is on ?x (top of a stack)
    (vowel ?x - block)                 ; block is vowel (movable by vowel agent)
    (consonant ?x - block)             ; block is consonant (movable by consonant agent)

    ;; Vowel agent hand state
    (holding-vowel ?x - block)
    (handempty-vowel)

    ;; Consonant agent hand state
    (holding-cons ?x - block)
    (handempty-cons)
  )

  ;; ===========================
  ;; Vowel-agent actions
  ;; (vowel agent may move only vowel-labeled blocks)
  ;; ===========================

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

  ;; ===========================
  ;; Consonant-agent actions
  ;; (consonant agent may move only consonant-labeled blocks)
  ;; ===========================

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

  (:action cons-putdown-to-table
    :parameters (?x - block)
    :precondition (and (consonant ?x) (holding-cons ?x))
    :effect (and
      (not (holding-cons ?x))
      (ontable ?x)
      (clear ?x)
      (handempty-cons)
    )
  )
)