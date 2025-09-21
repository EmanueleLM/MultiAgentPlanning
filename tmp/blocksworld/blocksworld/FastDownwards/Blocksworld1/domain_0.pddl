(define (domain multi-agent-blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)

    ;; per-agent hand predicates to keep agents' hands distinct
    (holding-vowel ?x - block)
    (handempty-vowel)
    (holding-cons ?x - block)
    (handempty-cons)

    ;; capability predicates
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Vowel-agent actions (namespaced with vowel-)
  (:action vowel-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-vowel) (vowel ?x))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (holding-vowel ?x)
      (not (handempty-vowel))
      (clear ?y)
    )
  )

  (:action vowel-pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty-vowel) (vowel ?x))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (holding-vowel ?x)
      (not (handempty-vowel))
    )
  )

  (:action vowel-putdown
    :parameters (?x - block)
    :precondition (and (holding-vowel ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-vowel)
      (not (holding-vowel ?x))
    )
  )

  (:action vowel-stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding-vowel ?x) (clear ?y) (vowel ?x))
    :effect (and
      (not (holding-vowel ?x))
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
      (handempty-vowel)
    )
  )

  ;; Consonant-agent actions (namespaced with cons-/consonant-)
  (:action cons-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-cons) (consonant ?x))
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (handempty-cons))
      (holding-cons ?x)
      (not (clear ?x))
    )
  )

  (:action cons-pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty-cons) (consonant ?x))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-cons))
      (holding-cons ?x)
    )
  )

  (:action cons-putdown
    :parameters (?x - block)
    :precondition (and (holding-cons ?x) (consonant ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-cons)
      (not (holding-cons ?x))
    )
  )

  (:action cons-stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding-cons ?x) (clear ?y) (consonant ?x))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty-cons)
      (not (holding-cons ?x))
      (not (clear ?y))
    )
  )
)