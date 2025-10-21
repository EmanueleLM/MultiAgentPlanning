(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding-vowel ?x - block)
    (holding-consonant ?x - block)
    (handempty-vowel)
    (handempty-consonant)
  )

  ;; Vowel-agent actions (can only move vowel blocks)
  (:action vowel-pickup
    :parameters (?b - vowel)
    :precondition (and (ontable ?b) (clear ?b) (handempty-vowel))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty-vowel))
              (holding-vowel ?b)
            )
  )

  (:action vowel-unstack
    :parameters (?b - vowel ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty-vowel))
    :effect (and
              (not (on ?b ?x))
              (clear ?x)
              (not (clear ?b))
              (not (handempty-vowel))
              (holding-vowel ?b)
            )
  )

  (:action vowel-putdown
    :parameters (?b - vowel)
    :precondition (and (holding-vowel ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (not (holding-vowel ?b))
              (handempty-vowel)
            )
  )

  (:action vowel-stack
    :parameters (?b - vowel ?x - block)
    :precondition (and (holding-vowel ?b) (clear ?x))
    :effect (and
              (on ?b ?x)
              (clear ?b)
              (not (clear ?x))
              (not (holding-vowel ?b))
              (handempty-vowel)
            )
  )

  ;; Consonant-agent actions (can only move consonant blocks)
  (:action consonant-pickup
    :parameters (?b - consonant)
    :precondition (and (ontable ?b) (clear ?b) (handempty-consonant))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty-consonant))
              (holding-consonant ?b)
            )
  )

  (:action consonant-unstack
    :parameters (?b - consonant ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty-consonant))
    :effect (and
              (not (on ?b ?x))
              (clear ?x)
              (not (clear ?b))
              (not (handempty-consonant))
              (holding-consonant ?b)
            )
  )

  (:action consonant-putdown
    :parameters (?b - consonant)
    :precondition (and (holding-consonant ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (not (holding-consonant ?b))
              (handempty-consonant)
            )
  )

  (:action consonant-stack
    :parameters (?b - consonant ?x - block)
    :precondition (and (holding-consonant ?b) (clear ?x))
    :effect (and
              (on ?b ?x)
              (clear ?b)
              (not (clear ?x))
              (not (holding-consonant ?b))
              (handempty-consonant)
            )
  )
)