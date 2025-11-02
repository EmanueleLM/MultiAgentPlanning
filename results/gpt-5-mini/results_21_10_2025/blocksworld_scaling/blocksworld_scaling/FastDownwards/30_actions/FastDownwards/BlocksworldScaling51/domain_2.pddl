(define (domain BlocksworldScaling51)
  :requirements :strips :typing :negative-preconditions
  :types block loc agent

  :predicates
    (on ?b - block ?p - (either block loc))
    (clear ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (is-vowel ?b - block)
    (is-consonant ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)

  (:action vowel-pick-from-block
    :parameters (?a - agent ?b - block ?p - block)
    :precondition (and
                    (vowel-agent ?a)
                    (handempty ?a)
                    (clear ?b)
                    (is-vowel ?b)
                    (on ?b ?p)
                   )
    :effect (and
              (not (on ?b ?p))
              (not (handempty ?a))
              (holding ?a ?b)
              (not (clear ?b))
              (clear ?p)
            )
  )

  (:action vowel-pick-from-table
    :parameters (?a - agent ?b - block ?t - loc)
    :precondition (and
                    (vowel-agent ?a)
                    (handempty ?a)
                    (clear ?b)
                    (is-vowel ?b)
                    (on ?b ?t)
                   )
    :effect (and
              (not (on ?b ?t))
              (not (handempty ?a))
              (holding ?a ?b)
              (not (clear ?b))
            )
  )

  (:action vowel-place-on-block
    :parameters (?a - agent ?b - block ?y - block)
    :precondition (and
                    (vowel-agent ?a)
                    (holding ?a ?b)
                    (clear ?y)
                    (is-vowel ?b)
                   )
    :effect (and
              (on ?b ?y)
              (clear ?b)
              (not (clear ?y))
              (not (holding ?a ?b))
              (handempty ?a)
            )
  )

  (:action vowel-place-on-table
    :parameters (?a - agent ?b - block ?t - loc)
    :precondition (and
                    (vowel-agent ?a)
                    (holding ?a ?b)
                    (is-vowel ?b)
                   )
    :effect (and
              (on ?b ?t)
              (clear ?b)
              (not (holding ?a ?b))
              (handempty ?a)
            )
  )

  (:action consonant-pick-from-block
    :parameters (?a - agent ?b - block ?p - block)
    :precondition (and
                    (consonant-agent ?a)
                    (handempty ?a)
                    (clear ?b)
                    (is-consonant ?b)
                    (on ?b ?p)
                   )
    :effect (and
              (not (on ?b ?p))
              (not (handempty ?a))
              (holding ?a ?b)
              (not (clear ?b))
              (clear ?p)
            )
  )

  (:action consonant-pick-from-table
    :parameters (?a - agent ?b - block ?t - loc)
    :precondition (and
                    (consonant-agent ?a)
                    (handempty ?a)
                    (clear ?b)
                    (is-consonant ?b)
                    (on ?b ?t)
                   )
    :effect (and
              (not (on ?b ?t))
              (not (handempty ?a))
              (holding ?a ?b)
              (not (clear ?b))
            )
  )

  (:action consonant-place-on-block
    :parameters (?a - agent ?b - block ?y - block)
    :precondition (and
                    (consonant-agent ?a)
                    (holding ?a ?b)
                    (clear ?y)
                    (is-consonant ?b)
                   )
    :effect (and
              (on ?b ?y)
              (clear ?b)
              (not (clear ?y))
              (not (holding ?a ?b))
              (handempty ?a)
            )
  )

  (:action consonant-place-on-table
    :parameters (?a - agent ?b - block ?t - loc)
    :precondition (and
                    (consonant-agent ?a)
                    (holding ?a ?b)
                    (is-consonant ?b)
                   )
    :effect (and
              (on ?b ?t)
              (clear ?b)
              (not (holding ?a ?b))
              (handempty ?a)
            )
  )
)