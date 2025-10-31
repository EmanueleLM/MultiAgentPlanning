(define (domain multiagent-blocks-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding-vowel ?b - block)
    (holding-cons ?b - block)
    (handempty-vowel)
    (handempty-cons)
    (vowel ?b - block)
    (can-manipulate ?b - block)
    (goal-reached)
  )

  (:action vowel-pick-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty-vowel))
    :effect (and
      (holding-vowel ?b)
      (not (ontable ?b))
      (not (handempty-vowel))
      (not (clear ?b))
    )
  )

  (:action vowel-pick-from-block
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (on ?b ?under) (clear ?b) (handempty-vowel))
    :effect (and
      (holding-vowel ?b)
      (clear ?under)
      (not (on ?b ?under))
      (not (handempty-vowel))
      (not (clear ?b))
    )
  )

  (:action vowel-place-on-table
    :parameters (?b - block)
    :precondition (and (holding-vowel ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty-vowel)
      (not (holding-vowel ?b))
    )
  )

  (:action vowel-place-on-block
    :parameters (?b - block ?target - block)
    :precondition (and (holding-vowel ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (handempty-vowel)
      (not (holding-vowel ?b))
    )
  )

  (:action cons-pickup-from-table
    :parameters (?b - block)
    :precondition (and (can-manipulate ?b) (ontable ?b) (clear ?b) (handempty-cons))
    :effect (and
      (holding-cons ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty-cons))
    )
  )

  (:action cons-pickup-from-block
    :parameters (?b - block ?under - block)
    :precondition (and (can-manipulate ?b) (on ?b ?under) (clear ?b) (handempty-cons))
    :effect (and
      (holding-cons ?b)
      (clear ?under)
      (not (on ?b ?under))
      (not (clear ?b))
      (not (handempty-cons))
    )
  )

  (:action cons-putdown-on-table
    :parameters (?b - block)
    :precondition (and (holding-cons ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty-cons)
      (not (holding-cons ?b))
    )
  )

  (:action cons-putdown-on-block
    :parameters (?b - block ?target - block)
    :precondition (and (holding-cons ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (handempty-cons)
      (not (holding-cons ?b))
    )
  )

  (:action orchestrator-announce-success
    :parameters (?a - block ?b - block ?c - block ?d - block ?e - block ?f - block ?g - block ?h - block ?i - block ?j - block)
    :precondition (and
      (on ?a ?b)
      (on ?b ?c)
      (on ?c ?d)
      (on ?d ?e)
      (on ?e ?f)
      (on ?f ?g)
      (on ?g ?h)
      (on ?h ?i)
      (on ?i ?j)
      (ontable ?j)
      (handempty-vowel)
      (handempty-cons)
    )
    :effect (and
      (goal-reached)
    )
  )
)