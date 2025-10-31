(define (domain multi_agent_blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    (vowel ?x - block)
    (consonant ?x - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  ;; Vowel-agent actions (vowel_agent may only manipulate vowel blocks A E I)
  (:action pick-vowel-from-table
    :parameters (?a - agent ?b - block)
    :precondition (and (vowel-agent ?a) (vowel ?b) (ontable ?b) (clear ?b) (handempty ?a))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b)
            )
  )

  (:action pick-vowel-from-block
    :parameters (?a - agent ?b - block ?x - block)
    :precondition (and (vowel-agent ?a) (vowel ?b) (on ?b ?x) (clear ?b) (handempty ?a))
    :effect (and
              (not (on ?b ?x))
              (not (clear ?b))
              (clear ?x)
              (not (handempty ?a))
              (holding ?a ?b)
            )
  )

  (:action put-vowel-on-table
    :parameters (?a - agent ?b - block)
    :precondition (and (vowel-agent ?a) (holding ?a ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b))
            )
  )

  (:action put-vowel-on-block
    :parameters (?a - agent ?b - block ?x - block)
    :precondition (and (vowel-agent ?a) (holding ?a ?b) (clear ?x) (not (= ?b ?x)))
    :effect (and
              (on ?b ?x)
              (clear ?b)
              (not (clear ?x))
              (handempty ?a)
              (not (holding ?a ?b))
            )
  )

  ;; Consonant-agent actions (consonant_agent may only manipulate consonant blocks B C D F G H J K)
  (:action pick-cons-from-table
    :parameters (?a - agent ?b - block)
    :precondition (and (consonant-agent ?a) (consonant ?b) (ontable ?b) (clear ?b) (handempty ?a))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b)
            )
  )

  (:action pick-cons-from-block
    :parameters (?a - agent ?b - block ?x - block)
    :precondition (and (consonant-agent ?a) (consonant ?b) (on ?b ?x) (clear ?b) (handempty ?a))
    :effect (and
              (not (on ?b ?x))
              (not (clear ?b))
              (clear ?x)
              (not (handempty ?a))
              (holding ?a ?b)
            )
  )

  (:action put-cons-on-table
    :parameters (?a - agent ?b - block)
    :precondition (and (consonant-agent ?a) (holding ?a ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b))
            )
  )

  (:action put-cons-on-block
    :parameters (?a - agent ?b - block ?x - block)
    :precondition (and (consonant-agent ?a) (holding ?a ?b) (clear ?x) (not (= ?b ?x)))
    :effect (and
              (on ?b ?x)
              (clear ?b)
              (not (clear ?x))
              (handempty ?a)
              (not (holding ?a ?b))
            )
  )

)