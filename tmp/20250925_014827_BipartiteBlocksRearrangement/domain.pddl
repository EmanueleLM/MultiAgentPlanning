(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions :quantified-preconditions)
  (:types object block table agent)

  (:predicates
    (on ?b - block ?p - object)
    (clear ?p - object)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (vagent ?a - agent)
    (cagent ?a - agent)
  )

  (:action pick-vagent
    :parameters (?a - agent ?b - block ?support - object)
    :precondition (and
                    (vagent ?a)
                    (vowel ?b)
                    (on ?b ?support)
                    (clear ?b)
                    (handempty ?a)
                  )
    :effect (and
              (not (on ?b ?support))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b)
              (clear ?support)
            )
  )

  (:action put-vagent
    :parameters (?a - agent ?b - block ?target - object)
    :precondition (and
                    (vagent ?a)
                    (holding ?a ?b)
                    (clear ?target)
                    (forall (?aa - agent) (not (holding ?aa ?target)))
                  )
    :effect (and
              (not (holding ?a ?b))
              (handempty ?a)
              (on ?b ?target)
              (clear ?b)
              (not (clear ?target))
            )
  )

  (:action pick-cagent
    :parameters (?a - agent ?b - block ?support - object)
    :precondition (and
                    (cagent ?a)
                    (consonant ?b)
                    (on ?b ?support)
                    (clear ?b)
                    (handempty ?a)
                  )
    :effect (and
              (not (on ?b ?support))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b)
              (clear ?support)
            )
  )

  (:action put-cagent
    :parameters (?a - agent ?b - block ?target - object)
    :precondition (and
                    (cagent ?a)
                    (holding ?a ?b)
                    (clear ?target)
                    (forall (?aa - agent) (not (holding ?aa ?target)))
                  )
    :effect (and
              (not (holding ?a ?b))
              (handempty ?a)
              (on ?b ?target)
              (clear ?b)
              (not (clear ?target))
            )
  )
)