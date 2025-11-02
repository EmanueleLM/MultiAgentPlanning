(define (domain multiagent-blocksworld22)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (is-agent ?a - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (can-move ?a - agent ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
  )

  ;; Vowel agent actions
  (:action vowel-pick-up-from-table
    :parameters (?a - agent ?b - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?b)
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?a ?b)
      (not (handempty ?a))
      (not (clear ?b))
    )
  )

  (:action vowel-unstack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?b)
      (vowel ?b)
      (on ?b ?c)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b ?c))
      (holding ?a ?b)
      (not (handempty ?a))
      (clear ?c)
      (not (clear ?b))
    )
  )

  (:action vowel-put-down
    :parameters (?a - agent ?b - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?b)
      (vowel ?b)
      (holding ?a ?b)
    )
    :effect (and
      (ontable ?b)
      (not (holding ?a ?b))
      (handempty ?a)
      (clear ?b)
    )
  )

  (:action vowel-stack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?x)
      (vowel ?x)
      (holding ?a ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (not (holding ?a ?x))
      (handempty ?a)
      (not (clear ?y))
      (clear ?x)
    )
  )

  ;; Consonant agent actions
  (:action consonant-pick-up-from-table
    :parameters (?a - agent ?b - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?b)
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?a ?b)
      (not (handempty ?a))
      (not (clear ?b))
    )
  )

  (:action consonant-unstack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?b)
      (consonant ?b)
      (on ?b ?c)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b ?c))
      (holding ?a ?b)
      (not (handempty ?a))
      (clear ?c)
      (not (clear ?b))
    )
  )

  (:action consonant-put-down
    :parameters (?a - agent ?b - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?b)
      (consonant ?b)
      (holding ?a ?b)
    )
    :effect (and
      (ontable ?b)
      (not (holding ?a ?b))
      (handempty ?a)
      (clear ?b)
    )
  )

  (:action consonant-stack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and
      (is-agent ?a)
      (can-move ?a ?x)
      (consonant ?x)
      (holding ?a ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (not (holding ?a ?x))
      (handempty ?a)
      (not (clear ?y))
      (clear ?x)
    )
  )
)