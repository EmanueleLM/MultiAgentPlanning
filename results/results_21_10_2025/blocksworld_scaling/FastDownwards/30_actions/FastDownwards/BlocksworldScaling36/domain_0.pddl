(define (domain blocks-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Vowel-agent actions: can only act on blocks marked (vowel ?x)
  (:action vowel-pick-up
    :parameters (?x - block)
    :precondition (and (vowel ?x) (clear ?x) (ontable ?x) (handempty))
    :effect (and (holding ?x) (not (ontable ?x)) (not (clear ?x)) (not (handempty)))
  )

  (:action vowel-put-down
    :parameters (?x - block)
    :precondition (and (vowel ?x) (holding ?x))
    :effect (and (ontable ?x) (clear ?x) (handempty) (not (holding ?x)))
  )

  (:action vowel-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (on ?x ?y) (clear ?x) (handempty))
    :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (clear ?x)) (not (handempty)))
  )

  (:action vowel-stack
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (holding ?x) (clear ?y))
    :effect (and (on ?x ?y) (clear ?x) (handempty) (not (holding ?x)) (not (clear ?y)))
  )

  ;; Consonant-agent actions: can only act on blocks marked (consonant ?x)
  (:action consonant-pick-up
    :parameters (?x - block)
    :precondition (and (consonant ?x) (clear ?x) (ontable ?x) (handempty))
    :effect (and (holding ?x) (not (ontable ?x)) (not (clear ?x)) (not (handempty)))
  )

  (:action consonant-put-down
    :parameters (?x - block)
    :precondition (and (consonant ?x) (holding ?x))
    :effect (and (ontable ?x) (clear ?x) (handempty) (not (holding ?x)))
  )

  (:action consonant-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?y) (clear ?x) (handempty))
    :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (clear ?x)) (not (handempty)))
  )

  (:action consonant-stack
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (holding ?x) (clear ?y))
    :effect (and (on ?x ?y) (clear ?x) (handempty) (not (holding ?x)) (not (clear ?y)))
  )
)