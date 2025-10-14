(define (domain blocks_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (holding-vowel ?x - block)
    (holding-consonant ?x - block)
    (free-vowel)
    (free-consonant)
  )

  ;; Vowel-agent actions (vowel_agent can manipulate only A, E, I)
  (:action vowel_pick_from_table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (free-vowel))
    :effect (and (not (ontable ?b)) (not (clear ?b)) (not (free-vowel)) (holding-vowel ?b))
  )

  (:action vowel_pick_from_on
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (on ?b ?under) (clear ?b) (free-vowel))
    :effect (and (not (on ?b ?under)) (clear ?under) (not (clear ?b)) (not (free-vowel)) (holding-vowel ?b))
  )

  (:action vowel_put_on_table
    :parameters (?b - block)
    :precondition (and (holding-vowel ?b))
    :effect (and (ontable ?b) (clear ?b) (free-vowel) (not (holding-vowel ?b)))
  )

  (:action vowel_put_on
    :parameters (?b - block ?target - block)
    :precondition (and (holding-vowel ?b) (clear ?target))
    :effect (and (on ?b ?target) (clear ?b) (not (clear ?target)) (free-vowel) (not (holding-vowel ?b)))
  )

  ;; Consonant-agent actions (consonant_agent can manipulate only B C D F G H J K L M N)
  (:action consonant_pick_from_table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (free-consonant))
    :effect (and (not (ontable ?b)) (not (clear ?b)) (not (free-consonant)) (holding-consonant ?b))
  )

  (:action consonant_pick_from_on
    :parameters (?b - block ?under - block)
    :precondition (and (consonant ?b) (on ?b ?under) (clear ?b) (free-consonant))
    :effect (and (not (on ?b ?under)) (clear ?under) (not (clear ?b)) (not (free-consonant)) (holding-consonant ?b))
  )

  (:action consonant_put_on_table
    :parameters (?b - block)
    :precondition (and (holding-consonant ?b))
    :effect (and (ontable ?b) (clear ?b) (free-consonant) (not (holding-consonant ?b)))
  )

  (:action consonant_put_on
    :parameters (?b - block ?target - block)
    :precondition (and (holding-consonant ?b) (clear ?target))
    :effect (and (on ?b ?target) (clear ?b) (not (clear ?target)) (free-consonant) (not (holding-consonant ?b)))
  )
)