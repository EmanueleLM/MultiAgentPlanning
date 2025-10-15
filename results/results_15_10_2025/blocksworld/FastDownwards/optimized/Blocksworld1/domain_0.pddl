(define (domain multi-agent-blocks)
  (:requirements :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (is-vowel-agent ?a - agent)
    (is-consonant-agent ?a - agent)
  )

  ;; Vowel-agent actions (vowel_agent may only pick/place A, E, I)
  (:action vowel-pick-from-table
    :parameters (?a - agent ?b - block)
    :precondition (and (is-vowel-agent ?a) (vowel ?b) (ontable ?b) (clear ?b) (handempty ?a))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b)
            )
  )

  (:action vowel-pick
    :parameters (?a - agent ?b - block ?under - block)
    :precondition (and (is-vowel-agent ?a) (vowel ?b) (on ?b ?under) (clear ?b) (handempty ?a))
    :effect (and
              (not (on ?b ?under))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b)
              (clear ?under)
            )
  )

  (:action vowel-place-on-table
    :parameters (?a - agent ?b - block)
    :precondition (and (is-vowel-agent ?a) (vowel ?b) (holding ?a ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b))
            )
  )

  (:action vowel-place-on
    :parameters (?a - agent ?b - block ?target - block)
    :precondition (and (is-vowel-agent ?a) (vowel ?b) (holding ?a ?b) (clear ?target))
    :effect (and
              (on ?b ?target)
              (clear ?b)
              (not (clear ?target))
              (handempty ?a)
              (not (holding ?a ?b))
            )
  )

  ;; Consonant-agent actions (consonant_agent may only pick/place B C D F G H J)
  (:action consonant-pick-from-table
    :parameters (?a - agent ?b - block)
    :precondition (and (is-consonant-agent ?a) (consonant ?b) (ontable ?b) (clear ?b) (handempty ?a))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b)
            )
  )

  (:action consonant-pick
    :parameters (?a - agent ?b - block ?under - block)
    :precondition (and (is-consonant-agent ?a) (consonant ?b) (on ?b ?under) (clear ?b) (handempty ?a))
    :effect (and
              (not (on ?b ?under))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b)
              (clear ?under)
            )
  )

  (:action consonant-place-on-table
    :parameters (?a - agent ?b - block)
    :precondition (and (is-consonant-agent ?a) (consonant ?b) (holding ?a ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b))
            )
  )

  (:action consonant-place-on
    :parameters (?a - agent ?b - block ?target - block)
    :precondition (and (is-consonant-agent ?a) (consonant ?b) (holding ?a ?b) (clear ?target))
    :effect (and
              (on ?b ?target)
              (clear ?b)
              (not (clear ?target))
              (handempty ?a)
              (not (holding ?a ?b))
            )
  )
)