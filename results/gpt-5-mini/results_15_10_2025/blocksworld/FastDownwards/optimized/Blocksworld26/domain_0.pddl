(define (domain blocks-multiagent)
  (:requirements :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty-vowel)
    (holding-vowel ?x - block)
    (handempty-consonant)
    (holding-consonant ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Vowel-agent actions (vowel_agent can only move A E I, only top blocks, one at a time)
  (:action vowel-pickup-from-table
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty-vowel) (vowel ?x))
    :effect (and (not (ontable ?x)) (not (handempty-vowel)) (holding-vowel ?x))
  )

  (:action vowel-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-vowel) (vowel ?x))
    :effect (and (not (on ?x ?y)) (clear ?y) (not (handempty-vowel)) (holding-vowel ?x))
  )

  (:action vowel-stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding-vowel ?x) (clear ?y) (vowel ?x))
    :effect (and (on ?x ?y) (clear ?x) (not (clear ?y)) (not (holding-vowel ?x)) (handempty-vowel))
  )

  (:action vowel-putdown-on-table
    :parameters (?x - block)
    :precondition (and (holding-vowel ?x) (vowel ?x))
    :effect (and (ontable ?x) (clear ?x) (not (holding-vowel ?x)) (handempty-vowel))
  )

  ;; Consonant-agent actions (consonant_agent can only move B C D F G H J K L M N)
  (:action consonant-pickup-from-table
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty-consonant) (consonant ?x))
    :effect (and (not (ontable ?x)) (not (handempty-consonant)) (holding-consonant ?x))
  )

  (:action consonant-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-consonant) (consonant ?x))
    :effect (and (not (on ?x ?y)) (clear ?y) (not (handempty-consonant)) (holding-consonant ?x))
  )

  (:action consonant-stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding-consonant ?x) (clear ?y) (consonant ?x))
    :effect (and (on ?x ?y) (clear ?x) (not (clear ?y)) (not (holding-consonant ?x)) (handempty-consonant))
  )

  (:action consonant-putdown-on-table
    :parameters (?x - block)
    :precondition (and (holding-consonant ?x) (consonant ?x))
    :effect (and (ontable ?x) (clear ?x) (not (holding-consonant ?x)) (handempty-consonant))
  )
)