(define (domain multi-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)
  (:predicates
    (ontable ?b - block)
    (on ?b - block ?support - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (handempty-vowel)
    (holding-vowel ?b - block)
    (handempty-consonant)
    (holding-consonant ?b - block)
  )

  ;; Vowel-agent actions: can only move blocks marked as vowel
  (:action pick-vowel
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty-vowel))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty-vowel))
      (holding-vowel ?b)
    )
  )

  (:action unstack-vowel
    :parameters (?b - block ?support - block)
    :precondition (and (vowel ?b) (on ?b ?support) (clear ?b) (handempty-vowel))
    :effect (and
      (not (on ?b ?support))
      (clear ?support)
      (not (clear ?b))
      (not (handempty-vowel))
      (holding-vowel ?b)
    )
  )

  (:action putdown-vowel
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding-vowel ?b))
    :effect (and
      (not (holding-vowel ?b))
      (ontable ?b)
      (clear ?b)
      (handempty-vowel)
    )
  )

  (:action stack-vowel
    :parameters (?b - block ?dest - block)
    :precondition (and (vowel ?b) (holding-vowel ?b) (clear ?dest))
    :effect (and
      (not (holding-vowel ?b))
      (not (clear ?dest))
      (clear ?b)
      (on ?b ?dest)
      (handempty-vowel)
    )
  )

  ;; Consonant-agent actions: can only move blocks marked as consonant
  (:action pick-consonant
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty-consonant))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty-consonant))
      (holding-consonant ?b)
    )
  )

  (:action unstack-consonant
    :parameters (?b - block ?support - block)
    :precondition (and (consonant ?b) (on ?b ?support) (clear ?b) (handempty-consonant))
    :effect (and
      (not (on ?b ?support))
      (clear ?support)
      (not (clear ?b))
      (not (handempty-consonant))
      (holding-consonant ?b)
    )
  )

  (:action putdown-consonant
    :parameters (?b - block)
    :precondition (and (consonant ?b) (holding-consonant ?b))
    :effect (and
      (not (holding-consonant ?b))
      (ontable ?b)
      (clear ?b)
      (handempty-consonant)
    )
  )

  (:action stack-consonant
    :parameters (?b - block ?dest - block)
    :precondition (and (consonant ?b) (holding-consonant ?b) (clear ?dest))
    :effect (and
      (not (holding-consonant ?b))
      (not (clear ?dest))
      (clear ?b)
      (on ?b ?dest)
      (handempty-consonant)
    )
  )
)