(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent vowel_agent consonant_agent table)

  (:predicates
    ;; spatial relations
    (ontable ?b - block ?t - table)
    (on ?b - block ?c - block)
    (clear ?b - block)

    ;; agent state
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)

    ;; table availability
    (free-table ?t - table)

    ;; block labels
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Vowel-agent picks a vowel block from a table spot
  (:action pick-vowel-from-table
    :parameters (?ag - vowel_agent ?b - block ?t - table)
    :precondition (and (vowel ?b) (ontable ?b ?t) (clear ?b) (handempty ?ag))
    :effect (and
      (not (ontable ?b ?t))
      (not (handempty ?ag))
      (not (clear ?b))
      (holding ?ag ?b)
      (free-table ?t)
    )
  )

  ;; Vowel-agent picks a vowel block from another block
  (:action pick-vowel-from-block
    :parameters (?ag - vowel_agent ?b - block ?below - block)
    :precondition (and (vowel ?b) (on ?b ?below) (clear ?b) (handempty ?ag))
    :effect (and
      (not (on ?b ?below))
      (not (handempty ?ag))
      (not (clear ?b))
      (holding ?ag ?b)
      (clear ?below)
    )
  )

  ;; Vowel-agent puts a held vowel block onto a free table spot
  (:action put-vowel-to-table
    :parameters (?ag - vowel_agent ?b - block ?t - table)
    :precondition (and (vowel ?b) (holding ?ag ?b) (free-table ?t))
    :effect (and
      (ontable ?b ?t)
      (handempty ?ag)
      (clear ?b)
      (not (holding ?ag ?b))
      (not (free-table ?t))
    )
  )

  ;; Vowel-agent puts a held vowel block onto another block
  (:action put-vowel-to-block
    :parameters (?ag - vowel_agent ?b - block ?target - block)
    :precondition (and (vowel ?b) (holding ?ag ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (handempty ?ag)
      (clear ?b)
      (not (holding ?ag ?b))
      (not (clear ?target))
    )
  )

  ;; Consonant-agent picks a consonant block from a table spot
  (:action pick-consonant-from-table
    :parameters (?ag - consonant_agent ?b - block ?t - table)
    :precondition (and (consonant ?b) (ontable ?b ?t) (clear ?b) (handempty ?ag))
    :effect (and
      (not (ontable ?b ?t))
      (not (handempty ?ag))
      (not (clear ?b))
      (holding ?ag ?b)
      (free-table ?t)
    )
  )

  ;; Consonant-agent picks a consonant block from another block
  (:action pick-consonant-from-block
    :parameters (?ag - consonant_agent ?b - block ?below - block)
    :precondition (and (consonant ?b) (on ?b ?below) (clear ?b) (handempty ?ag))
    :effect (and
      (not (on ?b ?below))
      (not (handempty ?ag))
      (not (clear ?b))
      (holding ?ag ?b)
      (clear ?below)
    )
  )

  ;; Consonant-agent puts a held consonant block onto a free table spot
  (:action put-consonant-to-table
    :parameters (?ag - consonant_agent ?b - block ?t - table)
    :precondition (and (consonant ?b) (holding ?ag ?b) (free-table ?t))
    :effect (and
      (ontable ?b ?t)
      (handempty ?ag)
      (clear ?b)
      (not (holding ?ag ?b))
      (not (free-table ?t))
    )
  )

  ;; Consonant-agent puts a held consonant block onto another block
  (:action put-consonant-to-block
    :parameters (?ag - consonant_agent ?b - block ?target - block)
    :precondition (and (consonant ?b) (holding ?ag ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (handempty ?ag)
      (clear ?b)
      (not (holding ?ag ?b))
      (not (clear ?target))
    )
  )
)