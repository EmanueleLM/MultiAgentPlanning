(define (domain combined_agents)
  (:requirements :strips :typing :equality)
  (:types block agent)
  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (is-vowel-agent ?a - agent)
    (is-consonant-agent ?a - agent)
    (is-orchestrator ?a - agent)
  )

  (:action vowel-pick-up-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (is-vowel-agent ?ag) (vowel ?b) (ontable ?b) (clear ?b) (handempty ?ag))
    :effect (and (not (ontable ?b)) (not (handempty ?ag)) (holding ?ag ?b) (not (clear ?b)))
  )

  (:action vowel-pick-up-from
    :parameters (?ag - agent ?b - block ?below - block)
    :precondition (and (is-vowel-agent ?ag) (vowel ?b) (on ?b ?below) (clear ?b) (handempty ?ag))
    :effect (and (not (on ?b ?below)) (clear ?below) (not (handempty ?ag)) (holding ?ag ?b) (not (clear ?b)))
  )

  (:action vowel-put-down-on-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (is-vowel-agent ?ag) (vowel ?b) (holding ?ag ?b))
    :effect (and (ontable ?b) (clear ?b) (handempty ?ag) (not (holding ?ag ?b)))
  )

  (:action vowel-put-down-on
    :parameters (?ag - agent ?b - block ?t - block)
    :precondition (and (is-vowel-agent ?ag) (vowel ?b) (holding ?ag ?b) (clear ?t))
    :effect (and (on ?b ?t) (clear ?b) (not (clear ?t)) (handempty ?ag) (not (holding ?ag ?b)))
  )

  (:action consonant-pick-up-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (is-consonant-agent ?ag) (consonant ?b) (ontable ?b) (clear ?b) (handempty ?ag))
    :effect (and (not (ontable ?b)) (not (handempty ?ag)) (holding ?ag ?b) (not (clear ?b)))
  )

  (:action consonant-pick-up-from
    :parameters (?ag - agent ?b - block ?below - block)
    :precondition (and (is-consonant-agent ?ag) (consonant ?b) (on ?b ?below) (clear ?b) (handempty ?ag))
    :effect (and (not (on ?b ?below)) (clear ?below) (not (handempty ?ag)) (holding ?ag ?b) (not (clear ?b)))
  )

  (:action consonant-put-down-on-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (is-consonant-agent ?ag) (consonant ?b) (holding ?ag ?b))
    :effect (and (ontable ?b) (clear ?b) (handempty ?ag) (not (holding ?ag ?b)))
  )

  (:action consonant-put-down-on
    :parameters (?ag - agent ?b - block ?t - block)
    :precondition (and (is-consonant-agent ?ag) (consonant ?b) (holding ?ag ?b) (clear ?t))
    :effect (and (on ?b ?t) (clear ?b) (not (clear ?t)) (handempty ?ag) (not (holding ?ag ?b)))
  )
)