(define (domain multi-agent-blocks)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (on ?b ?s)
    (on-table ?b)
    (clear ?b)
    (handempty ?agent)
    (holding ?agent ?b)
    (agent-can-move ?agent ?b)
  )

  ;; Vowel-agent actions (kept distinct in name, agent is a parameter)
  (:action vowel-pickup
    :parameters (?agent ?b)
    :precondition (and
      (on-table ?b)
      (clear ?b)
      (handempty ?agent)
      (agent-can-move ?agent ?b)
    )
    :effect (and
      (not (on-table ?b))
      (not (clear ?b))
      (not (handempty ?agent))
      (holding ?agent ?b)
    )
  )

  (:action vowel-unstack
    :parameters (?agent ?b ?s)
    :precondition (and
      (on ?b ?s)
      (clear ?b)
      (handempty ?agent)
      (agent-can-move ?agent ?b)
    )
    :effect (and
      (not (on ?b ?s))
      (clear ?s)
      (not (clear ?b))
      (not (handempty ?agent))
      (holding ?agent ?b)
    )
  )

  (:action vowel-putdown-table
    :parameters (?agent ?b)
    :precondition (and
      (holding ?agent ?b)
    )
    :effect (and
      (on-table ?b)
      (clear ?b)
      (handempty ?agent)
      (not (holding ?agent ?b))
    )
  )

  (:action vowel-stack
    :parameters (?agent ?b ?t)
    :precondition (and
      (holding ?agent ?b)
      (clear ?t)
      (agent-can-move ?agent ?b)
    )
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (clear ?t))
      (handempty ?agent)
      (not (holding ?agent ?b))
    )
  )

  ;; Consonant-agent actions (kept distinct in name, agent is a parameter)
  (:action consonant-pickup
    :parameters (?agent ?b)
    :precondition (and
      (on-table ?b)
      (clear ?b)
      (handempty ?agent)
      (agent-can-move ?agent ?b)
    )
    :effect (and
      (not (on-table ?b))
      (not (clear ?b))
      (not (handempty ?agent))
      (holding ?agent ?b)
    )
  )

  (:action consonant-unstack
    :parameters (?agent ?b ?s)
    :precondition (and
      (on ?b ?s)
      (clear ?b)
      (handempty ?agent)
      (agent-can-move ?agent ?b)
    )
    :effect (and
      (not (on ?b ?s))
      (clear ?s)
      (not (clear ?b))
      (not (handempty ?agent))
      (holding ?agent ?b)
    )
  )

  (:action consonant-putdown-table
    :parameters (?agent ?b)
    :precondition (and
      (holding ?agent ?b)
    )
    :effect (and
      (on-table ?b)
      (clear ?b)
      (handempty ?agent)
      (not (holding ?agent ?b))
    )
  )

  (:action consonant-stack
    :parameters (?agent ?b ?t)
    :precondition (and
      (holding ?agent ?b)
      (clear ?t)
      (agent-can-move ?agent ?b)
    )
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (clear ?t))
      (handempty ?agent)
      (not (holding ?agent ?b))
    )
  )
)